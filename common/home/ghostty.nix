{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.ghostty = {
    # macOS: the app comes from the Homebrew cask; home-manager only writes the config.
    package = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin null;
    settings = {
      # A GUI-launched shell gets launchd's bare PATH. Login zsh sets up the Nix/home-manager
      # environment, then hands the terminal to nu.
      command = "${lib.getExe config.programs.zsh.package} -l -c 'exec ${lib.getExe config.programs.nushell.package}'";
      # Ghostty would detect zsh from `command` and inject zsh integration; nu emits OSC 133 itself.
      shell-integration = "none";
      theme = "Dracula";
      font-family = "Iosevka Nerd Font Mono";
      font-size = 14;
      macos-option-as-alt = true;
    };
  };
}
