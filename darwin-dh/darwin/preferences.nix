{ pkgs, ... }: {
  nix.configureBuildUsers = true;

  # TODO: Configure binary cache public key
  # nix = {
  #   binaryCaches = [ "https://cache.nixos.org/" ];
  #   binaryCachePublicKeys =
  #     [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
  #   trustedUsers = [ "@admin" ];
  # };

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
    extra-platforms = x86_64-darwin
  '';

  services.nix-daemon.enable = true;
  system.keyboard.enableKeyMapping = true;

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
    fontDir = { enable = true; };
    fonts = with pkgs; [
      recursive
      iosevka-bin
      (nerdfonts.override { fonts = [ "Meslo" ]; })
    ];
  };
}
