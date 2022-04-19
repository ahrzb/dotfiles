{ pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    cleanup = "zap";
    global.brewfile = true;
    global.noLock = true;
    taps =
      [ "homebrew/bundle" "homebrew/cask" "homebrew/core" "homebrew/services" ];
    brews = [ "julia" ];
    casks = [
      "1password"
      "alfred"
      "calibre"
      "docker"
      "emacs"
      "firefox"
      "google-chrome"
      "google-drive"
      "intellij-idea-ce"
      "iterm2"
      "mendeley"
      "pycharm-ce"
      "rstudio"
      "skype"
      "slack"
      "spotify"
      "ticktick"
      "tiles"
      "virtualbox"
      "visual-studio-code"
    ];
  };
}
