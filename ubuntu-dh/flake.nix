{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    registry = {
      pkgs = nixpkgs;
    };
    overlays = {
      emacs-overlay = (import inputs.emacs-overlay);
    };
    home = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./home.nix ./packages.nix ./zsh.nix ./bash.nix ./python.nix ./modules ./neovim.nix
        {
          nixpkgs.overlays = nixpkgs.lib.attrValues overlays;
          nix.registry = nixpkgs.lib.mapAttrs (name: flake: {
            from.id = name;
            from.type = "indirect";
            to.path = flake;
            to.type = "path";
          }) registry;
        }
      ];
      extraSpecialArgs = {
        overlays = nixpkgs.lib.attrValues overlays;
        nixpkgs = overlays;
      };
    };
  in {
    packages.x86_64-linux.homeConfigurations = home;
    apps.x86_64-linux.sync = {
      type = "app";
      program = "${home.activationPackage}/activate";
    };
  };
}
