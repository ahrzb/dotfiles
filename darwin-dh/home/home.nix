{ pkgs, ... }: {
  home.stateVersion = "22.05";

  home.sessionVariables = {
    EDITOR = "vim";
    LANG = "en_US.UTF-8";
  };

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
          condition = "gitdir:~/repos/gitlab.com/ahrzb/**";
        }
        {
          path = ./dotfiles/git/personal.gitconfig;
          condition = "gitdir:~/repos/codeberg.org/ahrzb/**";
        }
      ];
    };

    neovim = { vimAlias = true; };

    nixvim = {
      enable = true;
      plugins.lightline.enable = true;
      colorschemes.base16 = {
        colorscheme = "dracula";
        enable = true;
      };
      extraPlugins = with pkgs.vimPlugins; [ SpaceVim ];
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

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    ssh = {
      enable = true;
      extraConfig = ''
        Host *
          UseKeychain yes
          AddKeysToAgent yes
      '';
    };
  };

  deliveryhero = {
    disableKubeConfigEnv = true;
    logisticsConsolidatedConfig = {
      enable = true;
      logisticsKubernetesRev = "17f024403b8776f71902d3dc1a0da6ae40d04958";
    };
    logisticsSaml2awsConfig = {
      enable = true;
      logisticsTerraformRev = "dc97df219b30d61ee9c667adc5c437d548def4c7";
    };
  };
}
