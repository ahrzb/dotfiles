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
      "raycast"
      "calibre"
      "discord"
      "docker"
      "emacs"
      "figma"
      "firefox"
      "google-chrome"
      "google-drive"
      "iterm2"
      "julia"
      "macfuse"
      "mendeley"
      "minecraft"
      "notion"
      "rstudio"
      "skype"
      "spotify"
      "steam"
      "telegram"
      "ticktick"
      "tiles"
      "unity-hub"
      "visual-studio-code"
      "vlc"
      "whatsapp"
      "zoom"
    ];
  };
}
