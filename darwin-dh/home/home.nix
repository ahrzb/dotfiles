{ config, pkgs, lib, ... }: {
  home.stateVersion = "22.05";

  home.sessionVariables = { EDITOR = "vim"; };

  programs = {
    git = {
      enable = true;
      aliases = {
        co = "checkout";
        lg = "log --oneline --decorate --graph";
      };
      extraConfig = {
        core.excludesfile = "${./dotfiles/git/global.gitignore}";
      };
      includes = [
        {
          path = ./dotfiles/git/deliveryhero.gitconfig;
          condition = "gitdir:~/repos/github.com/deliveryhero/**";
        }
        {
          path = ./dotfiles/git/personal.gitconfig;
          condition = "gitdir:~/repos/github.com/ahrzb/**";
        }
        {
          path = ./dotfiles/git/personal.gitconfig;
          condition = "gitdir:~/repos/codeberg.org/ahrzb/**";
        }
      ];
    };

    direnv = {
      enable = true;
      nix-direnv = { enable = true; };
    };

    htop = {
      enable = true;
      settings = { show_program_path = true; };
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
