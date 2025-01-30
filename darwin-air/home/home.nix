{ config, ... }: {
  home = {
    stateVersion = "22.05";
    username = "ahrzb";
    sessionVariables = { };
    shellAliases = { };
    file = { };
    shellAliases = { };
  };

  programs = {
    git.enable = true;
    direnv.enable = true;
    neovim.enable = true;
    zsh = {
      enable = true;
      profileExtra = ''
        source "${config.xdg.configHome}/asdf-direnv/zshrc"
      '';
    };

    htop = {
      enable = true;
      settings = { show_program_path = true; };
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  deliveryhero = { };
}
