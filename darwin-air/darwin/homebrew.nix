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
      "homebrew/cask"
      "homebrew/core"
      "homebrew/services"
      {
        name = "lencx/chatgpt";
        clone_target = "https://github.com/lencx/chatgpt.git";
      }
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
      {
        name = "chatgpt";
        args = { no_quarantine = true; };
      }
    ];
  };
}
