{
  homebrew = {
    # Work machine: remove undeclared casks but keep their app data.
    onActivation.cleanup = "uninstall";

    casks = [
      "1password"
      "claude"
      "docker-desktop"
      "firefox"
      "ghostty"
      "google-chrome"
      "notion"
      "raycast"
      "slack"
      "visual-studio-code"
      "vorssaint"
      "zed"
    ];
  };
}
