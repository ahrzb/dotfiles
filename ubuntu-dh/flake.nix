{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    emacs-overlay.url = "github:nix-community/emacs-overlay/";
    emacs-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    home = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./home.nix ./packages.nix ./zsh.nix ./bash.nix ./python.nix ./modules
        {
          nixpkgs.overlays = [
            (import inputs.emacs-overlay)
          ];
        }
      ];
    };
  in {
    packages.x86_64-linux.homeConfigurations = home;
    apps.x86_64-linux.activate = {
      type = "app";
      program = "${home.activationPackage}/activate";
    };
  };
}
