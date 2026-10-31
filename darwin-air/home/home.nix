{ config, ... }:
{
  home.stateVersion = "22.05";

  programs.zsh = {
    dotDir = config.home.homeDirectory;
    profileExtra = ''
      source "${config.xdg.configHome}/asdf-direnv/zshrc"
    '';
  };
}
