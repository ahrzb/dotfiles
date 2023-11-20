{ nixpkgs, home-manager, ... }:
let
  system = "x86_64-linux";
  registry = { pkgs = nixpkgs; };
in
{
  nixosConfigurations."rapture" = nixpkgs.lib.nixosSystem
    {
      inherit system;
      modules = [
        ./nixos
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users."ahrzb" = {
            imports = [ ./home ];
            home = home-manager.lib.homeManagerConfiguration {
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
          };
        }
      ];
    };
}

