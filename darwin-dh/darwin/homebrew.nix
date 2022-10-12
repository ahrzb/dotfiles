{
  homebrew = {
    enable = true;
    cleanup = "zap";
    global.brewfile = true;
    global.noLock = true;
    taps =
      [ "homebrew/bundle" "homebrew/cask" "homebrew/core" "homebrew/services" ];
    brews = [ "gnu-getopt" "julia" "structurizr-cli" ];
    casks = [
      "1password"
      "alfred"
      "calibre"
      "docker"
      "emacs"
      "figma"
      "firefox"
      "google-chrome"
      "google-drive"
      "intellij-idea-ce"
      "iterm2"
      "jetbrains-toolbox"
      "mendeley"
      "notion"
      "pycharm-ce"
      "r"
      "rstudio"
      "skype"
      "slack"
      "spotify"
      "ticktick"
      "tiles"
      "virtualbox"
      "visual-studio-code"
    ];
    masApps = {
      "Xcode" = 497799835;
      "1Password for Safari" = 1569813296;
      "Kindle" = 405399194;
    };
  };
}
