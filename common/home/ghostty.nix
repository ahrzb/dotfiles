{ lib, pkgs, ... }:
{
  programs.ghostty = {
    # macOS: the app comes from the Homebrew cask; home-manager only writes the config.
    package = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin null;
    settings = {
      theme = "Dracula";
      font-family = "FiraCode Nerd Font Mono";
      font-size = 14;
      macos-option-as-alt = true;
    };
  };
}
