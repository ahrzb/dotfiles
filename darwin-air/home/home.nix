{ config, pkgs, lib, ... }: {
  home.stateVersion = "22.05";

  home.sessionVariables = { EDITOR = "vim"; };

  programs = {
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
