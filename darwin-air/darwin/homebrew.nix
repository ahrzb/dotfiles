{
  homebrew = {
    enable = true;
    global.brewfile = true;
    onActivation = {
      cleanup = "zap";
      upgrade = true;
    };
    taps = [
      "homebrew/bundle"
      "homebrew/services"
    ];
    brews = [ ];
    casks = [
      "1password"
      "alfred"
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
      "whatsapp"
      "chatgpt"
    ];
  };
}
