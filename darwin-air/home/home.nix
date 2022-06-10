{
  home.stateVersion = "22.05";

  home.sessionVariables = { EDITOR = "vim"; };

  programs = {
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
        name = "MesloLGS Nerd Font Mono";
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

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
