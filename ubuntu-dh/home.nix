{ pkgs, ... }: {
  home.stateVersion = "22.05";
  home.username = "a.roozbahani";
  home.homeDirectory = "/home/a.roozbahani";

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ]}";
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
        push.autoSetupRemote = true;
        blame.ignoreRevsFile = ".git-blame-ignore-revs";
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
      settings = {
        aws.style = "bold #ffb86c";
        cmd_duration.style = "bold #f1fa8c";
        directory.style = "bold #50fa7b";
        hostname.style = "bold #ff5555";
        git_branch.style = "bold #ff79c6";
        git_status.style = "bold #ff5555";
        username = {
          format = "[$user]($style) on ";
          style_user = "bold #bd93f9";
        };
        character = {
          success_symbol = "[λ](bold #f8f8f2)";
          error_symbol = "[λ](bold #ff5555)";
        };
      };
    };

    zoxide.enable = true;
    skim.enable = true;
    bat.enable = true;
    broot.enable = true;
    gh.enable = true;
    go.enable = true;
    jq.enable = true;
    k9s.enable = true;

    eza = {
      enable = true;
      enableAliases = true;
    };

    ssh = {
      enable = true;
      matchBlocks."*" = {
        host = "*";
        extraOptions.IdentityAgent = "~/.1password/agent.sock";
        extraOptions.AddKeysToAgent = "true";
      };
    };

    kitty = {
      enable = true;
      font = {
        package = pkgs.nerdfonts.override {
          fonts = [ "FiraCode" ];
        };
        name = "Fira Code";
      };
      settings = {
        font_size = 14;
        enable_audio_bell = false;
        background_opacity = "0.9";
      };
    };

    java = {
      enable = true;
      package = pkgs.openjdk11;
    };
  };

  deliveryhero = {
    disableKubeConfigEnv = true;
    logisticsConsolidatedConfig = {
      enable = false;
      logisticsKubernetesRev = "05145624401662c2a8de89b8fb11bbe8c64d7db6";
    };
    logisticsSaml2awsConfig = {
      enable = true;
      logisticsTerraformRev = "b308d8b426ff864c3c9da9562e9c94b750ff663a";
    };
  };
}
