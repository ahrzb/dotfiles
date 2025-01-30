{
  homebrew = {
    enable = true;

    global = {
      brewfile = true;
      autoUpdate = true;
    };

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    brews = [ ];

    casks = [
      "1password"
      "anki"
      "calibre"
      "discord"
      "docker"
      "figma"
      "firefox"
      "google-chrome"
      "google-drive"
      "mendeley"
      "minecraft"
      "notion"
      "skype"
      "spotify"
      "steam"
      "syncthing"
      "talon"
      "telegram"
      "ticktick"
      "tiles"
      "visual-studio-code"
      "vlc"
      "iina"
      "whatsapp"
      "chatgpt"
      "windscribe"
      "raycast"
      "qbittorrent"
      "ghostty"
      "zen-browser"
    ];
  };
}
