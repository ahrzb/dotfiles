{
  homebrew = {
    enable = true;
    cleanup = "zap";
    global.brewfile = true;
    global.noLock = true;
    taps =
      [ "homebrew/bundle" "homebrew/cask" "homebrew/core" "homebrew/services" "gromgit/homebrew-fuse" ];
    brews = [ "gromgit/fuse/ntfs-3g-mac" ];
    casks = [
      "1password"
      "alfred"
      "calibre"
      "docker"
      "emacs"
      "firefox"
      "google-chrome"
      "google-drive"
      "iterm2"
      "julia"
      "macfuse"
      "mendeley"
      "rstudio"
      "skype"
      "spotify"
      "steam"
      "telegram"
      "ticktick"
      "tiles"
      "visual-studio-code"
      "vlc"
      "whatsapp"
      "zoom"
    ];
  };
}
