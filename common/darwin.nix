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
      options = "--delete-older-than 14d";
    };
  };

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true; # Touch ID inside tmux/screen
  };

  # Login shell setup (Nix PATH in /etc/zshrc); interactive config lives in home-manager.
  programs.zsh.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
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
