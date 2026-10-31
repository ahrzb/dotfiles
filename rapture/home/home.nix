{ config, ... }:
{
  home.stateVersion = "22.05";

  xdg.enable = true;

  programs = {
    kitty.enable = true;
    zsh.dotDir = config.home.homeDirectory;
  };

  services.kdeconnect.enable = true;

  nix.gc = {
    automatic = true;
    persistent = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}
