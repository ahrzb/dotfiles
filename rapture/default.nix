{ nixpkgs, home-manager, ... }:
let
  system = "x86_64-linux";
in
{
  nixosConfigurations."rapture" = nixpkgs.lib.nixosSystem
    {
      inherit system;
      modules = [
        ./nixos
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users."ahrzb" = {
              imports = [ ./home ];
            };
          };
        }
        {
          nix.registry = {
            pkgs = {
              from = {
                id = "pkgs";
                type = "indirect";
              };
              to = {
                path = nixpkgs;
                type = "path";
              };
            };
          };
        }
      ];
    };
}

