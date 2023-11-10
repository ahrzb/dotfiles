{ pkgs, ... }: {
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
    configureBuildUsers = true;
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  services.nix-daemon.enable = true;
  system.keyboard.enableKeyMapping = true;
  security.pam.enableSudoTouchIdAuth = true;

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

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      samim-fonts
      vazir-fonts
      shabnam-fonts
      sahel-fonts
      parastoo-fonts

      recursive

      (nerdfonts.override { fonts = [ "Meslo" ]; })
    ];
  };
}
