{
  homebrew = {
    enable = true;

    global = {
      brewfile = true;
      autoUpdate = false;
    };

    onActivation = {
      cleanup = "zap";
      autoUpdate = false;
      upgrade = false;
    };

    brews = [ ];

    casks = [
      "1password"
      "anki"
      "calibre"
      "chatgpt"
      "claude"
      "discord"
      "docker-desktop"
      "figma"
      "firefox"
      "ghostty"
      "google-chrome"
      "google-drive"
      "iina"
      "mendeley"
      "minecraft"
      "notion"
      "qbittorrent"
      "raycast"
      "skype"
      "spotify"
      "steam"
      "syncthing-app"
      "talon"
      "telegram"
      "ticktick"
      "tiles"
      "visual-studio-code"
      "vlc"
      "vorssaint"
      "whatsapp"
      "windscribe"
      "zed"
      "zen"
    ];
  };
}
