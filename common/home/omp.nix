# Custom omp themes, installed into the default profile and the other identity's profile
# (each profile reads its own `agent/themes`). Select with `omp config set theme.dark <name>`.
{
  config,
  inputs,
  lib,
  ...
}:
let
  themes = {
    "titanium-dracula.json" = "${inputs.omp-theme-titanium-dracula}/titanium-dracula.json";
  };
  agentDirs = [
    ".omp/agent"
    ".omp/profiles/${config.identity.other}/agent"
  ];
in
{
  config = lib.mkIf config.programs.omp.enable {
    home.file = lib.listToAttrs (
      lib.concatMap (
        dir:
        lib.mapAttrsToList (
          name: source: lib.nameValuePair "${dir}/themes/${name}" { inherit source; }
        ) themes
      ) agentDirs
    );
  };
}
