{
  homebrew = {
    enable = false;

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
      "claude"
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
