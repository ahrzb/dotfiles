{ pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    # cleanup = "zap";
    # global.brewfile = true;
    # global.noLock = true;
    taps =
      [ "homebrew/bundle" "homebrew/cask" "homebrew/core" "homebrew/services" ];
    casks = [
      "1password"
      "alfred"
      "calibre"
      "docker"
      "emacs"
      "google-drive"
      "iterm2"
      "julia"
      "mendeley"
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
