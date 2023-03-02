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
    ];
    brews = [ ];
    casks = [
      "1password"
      "alfred"
      "calibre"
      "discord"
      "docker"
      "emacs"
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
      "telegram"
      "ticktick"
      "tiles"
      "visual-studio-code"
      "vlc"
      "whatsapp"
    ];
  };
}
