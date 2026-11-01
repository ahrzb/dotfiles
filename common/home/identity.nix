# Two identities, selected by directory under ~/repos/<host>/:
# the host's `identity.default` everywhere, the other one inside its own directories.
# Switches git email (includeIf), the gh account (GH_CONFIG_DIR) and the omp profile (OMP_PROFILE).
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.identity;
  hosts = [
    "github.com"
    "gitlab.com"
    "codeberg.org"
  ];
  identities = {
    personal = {
      email = "ahrzb5@gmail.com";
      dirs = map (host: "${host}/ahrzb") hosts;
    };
    work = {
      email = "amirhossein.r@datachef.co";
      dirs = [ "github.com/DataChefHQ" ];
    };
  };
  other = if cfg.default == "work" then "personal" else "work";

  # Re-export `pkg` with `bin` wrapped: started under the other identity's directories,
  # it gets `env` unless the caller already set those variables (even to empty).
  withIdentityEnv =
    pkg: bin: env:
    let
      wrapper = pkgs.writeShellScript "${bin}-identity" ''
        case "$PWD/" in
          ${lib.concatMapStringsSep " | " (dir: ''"$HOME/repos/${dir}/"*'') identities.${other}.dirs})
            ${lib.concatStringsSep "\n" (
              lib.mapAttrsToList (name: value: ''export ${name}="''${${name}-${value}}"'') env
            )}
            ;;
        esac
        exec ${pkg}/bin/${bin} "$@"
      '';
    in
    pkgs.symlinkJoin {
      name = "${pkg.pname}-identity-${pkg.version}";
      inherit (pkg) pname version meta;
      paths = [ pkg ];
      postBuild = ''
        rm "$out/bin/${bin}"
        ln -s ${wrapper} "$out/bin/${bin}"
      '';
    };
in
{
  options.identity = {
    default = lib.mkOption {
      type = lib.types.enum [
        "personal"
        "work"
      ];
      default = "personal";
      description = "Identity used under ~/repos/<host>/ outside the other identity's directories.";
    };
    other = lib.mkOption {
      type = lib.types.str;
      readOnly = true;
      default = other;
      description = "The non-default identity; also the name of its omp profile.";
    };
  };

  config = {
    # Later includes override earlier ones: catch-all hosts first, the other identity's dirs after.
    programs.git.includes =
      map (host: {
        condition = "gitdir/i:~/repos/${host}/**";
        contents.user.email = identities.${cfg.default}.email;
      }) hosts
      ++ map (dir: {
        condition = "gitdir/i:~/repos/${dir}/**";
        contents.user.email = identities.${other}.email;
      }) identities.${other}.dirs;

    # gh is also git's credential helper for github.com, so pushes follow the same account.
    programs.gh.package = withIdentityEnv pkgs.gh "gh" {
      GH_CONFIG_DIR = "$HOME/.config/gh-${other}";
    };

    programs.omp.package = withIdentityEnv pkgs.omp "omp" { OMP_PROFILE = other; };
  };
}
