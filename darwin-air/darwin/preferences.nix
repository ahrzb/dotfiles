{ pkgs, ... }: {
  system.stateVersion = 5;
  ids.gids.nixbld = 30000;

  users.users.ahrzb = {
    name = "ahrzb";
    home = "/Users/ahrzb";
  };

  nix = {
    settings = {
      trusted-users = [ "@admin" ];
      substituters = [ "https://cache.nixos.org/" ];
      trusted-public-keys =
        [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
    };
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  system.keyboard.enableKeyMapping = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  programs = {
    zsh = {
      enable = true;
      enableFzfCompletion = true;
      enableFzfGit = true;
      enableFzfHistory = true;
      enableSyntaxHighlighting = true;
    };
    nix-index.enable = false;
  };

  environment = {
    systemPackages = with pkgs; [ kitty ];
    variables = { };
  };

  fonts.packages = with pkgs; [
    samim-fonts
    vazirmatn
    shabnam-fonts
    sahel-fonts
    parastoo-fonts

    recursive

    nerd-fonts.meslo-lg
    nerd-fonts.fira-code
  ];
}
