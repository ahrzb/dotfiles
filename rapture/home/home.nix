{ pkgs, ... }:

{
  home = {
    stateVersion = "22.05";
    username = "ahrzb";
    homeDirectory = "/home/ahrzb";
    sessionVariables = { };
    file = { };
    shellAliases = { };
  };

  programs = {
    home-manager.enable = true;

    neovim.enable = true; # Configured in common/home
    git.enable = true; # Configured in common/home
    kitty.enable = true; # Configured in common/home
    zsh.enable = true; # Configured in common/home

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    htop = {
      enable = true;
      settings.show_program_path = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    skim = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    ssh = {
      enable = true;
      matchBlocks."*" = {
        host = "*";
        extraOptions.IdentityAgent = "~/.1password/agent.sock";
      };
    };
  };

  services = {
    kdeconnect.enable = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
