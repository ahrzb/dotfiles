{ pkgs, ... }: {
  users.nix.configureBuildUsers = true;

  nix = {
    binaryCaches = [ "https://cache.nixos.org/" ];
    binaryCachePublicKeys =
      [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
    trustedUsers = [ "@admin" ];
  };

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

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
    enableFontDir = true;
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
