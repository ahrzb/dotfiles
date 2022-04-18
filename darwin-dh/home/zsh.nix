{ config, pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    zplug = {
      enable = true;
      plugins = [
        {
          name = "plugins/zsh-interactive-cd";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/git";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/aws";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/pip";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/brew";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/python";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/docker";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/docker-compose";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/kubectl";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/z";
          tags = [ "from:oh-my-zsh" ];
        }
        { name = "changyuheng/fz"; }
      ];
    };
  };
}
