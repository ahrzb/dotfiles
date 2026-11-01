{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  programs.zed-editor = {
    # macOS: the app comes from the Homebrew cask; home-manager only installs the theme.
    # settings.json stays Zed's own (no userSettings), so pick the theme in Zed.
    package = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin null;
    themes.dracula = builtins.fromJSON (builtins.readFile "${inputs.dracula-zed}/themes/dracula.json");
  };
}
