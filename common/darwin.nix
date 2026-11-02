{ config, pkgs, ... }:
let
  user = config.system.primaryUser;
in
{
  users.users.${user}.home = "/Users/${user}";

  nix = {
    # Track the 2.35 line the installer put on new machines; `pkgs.nix` lags behind (2.34).
    package = pkgs.nixVersions.latest;
    # Admins may set substituters (devenv/cachix need this). Trusted users are effectively root.
    settings.trusted-users = [ "@admin" ];
    # `auto-optimise-store` is unsafe on macOS (NixOS/nix#7273); dedupe on a schedule instead.
    optimise.automatic = true;
    gc = {
      automatic = true;
      interval = {
        Hour = 3;
        Minute = 15;
      };
      options = "--delete-older-than 7d";
    };
  };

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true; # Touch ID inside tmux/screen
  };

  # Print the package diff of every switch. Remember the old system first: reloading the
  # activate-system launchd job mid-activation already repoints /run/current-system.
  system.activationScripts = {
    preActivation.text = ''
      oldSystem=$(readlink -f /run/current-system || true)
    '';
    postActivation.text = ''
      if [[ -n "$oldSystem" ]]; then
        ${pkgs.nvd}/bin/nvd --nix-bin-dir=${config.nix.package}/bin diff "$oldSystem" "$systemConfig"
      fi
    '';
  };

  # Login shell setup (Nix PATH in /etc/zshrc); interactive config lives in home-manager.
  programs.zsh.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
    nerd-fonts.iosevka
  ];

  # Installs and pins Homebrew itself; existing installs are adopted.
  nix-homebrew = {
    enable = true;
    inherit user;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    global = {
      brewfile = true;
      autoUpdate = false;
    };
    onActivation.autoUpdate = false;
  };
}
