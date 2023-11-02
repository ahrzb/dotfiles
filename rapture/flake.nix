{
  description = "System configurations of AmirHossein's home PC.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      registry = { pkgs = nixpkgs; };
    in
    {
      homeConfigurations."ahrzb" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home
          {
            nix.registry = nixpkgs.lib.mapAttrs
              (name: flake: {
                from.id = name;
                from.type = "indirect";
                to.path = flake;
                to.type = "path";
              })
              registry;
          }
        ];
      };
      nixosConfigurations."rapture" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./nixos ];
      };
    };
}
