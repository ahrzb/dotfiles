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

    git = {
      enable = true;
      userEmail = "ahrzb5@gmail.com";
      userName = "AmirHossein Roozbahani";
      aliases = {
        co = "checkout";
        sw = "switch";
        lg = "log --oneline --decorate --graph";
      };
    };

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
