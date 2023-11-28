{
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
    kitty.enable = true;
    direnv.enable = true;
    neovim.enable = true;
    zsh.enable = true;

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
}
