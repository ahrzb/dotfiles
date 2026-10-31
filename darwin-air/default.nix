{
  imports = [
    ./darwin/homebrew.nix
    ./darwin/preferences.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  home-manager.users.ahrzb = ./home;
}
