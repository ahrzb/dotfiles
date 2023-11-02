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
        lg = "log --oneline --decorate --graph";
      };
    };

    kitty = {
      enable = true;
      theme = "Dracula";
      darwinLaunchOptions = [ "--start-as=fullscreen" ];
      keybindings = {
        "alt+left" = "send_text all \\x1b\\x62";
        "alt+right" = "send_text all \\x1b\\x66";
      };
      font = {
        name = "Iosevka Nerd Font Mono";
        size = 14;
      };
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

    skim = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    # doom-emacs = {
    # enable = true;
    # doomPrivateDir = ./dotfiles/doom.d;
    # };

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
