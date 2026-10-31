{ inputs, ... }:
{
  imports = [ ./nixos ];

  nixpkgs.overlays = [
    (final: _prev: { ghostty = inputs.ghostty.packages.${final.stdenv.hostPlatform.system}.default; })
  ];

  home-manager.users.ahrzb = ./home;
}
