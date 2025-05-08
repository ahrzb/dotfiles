{ nixpkgs, home-manager, ghostty, ... }:
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
            backupFileExtension = ".backup";
            useGlobalPkgs = true;
            useUserPackages = true;
            users."ahrzb" = {
              imports = [ ../common/home ./home ];
            };
          };
          nixpkgs.overlays = [
            (self: super: { ghostty = ghostty.packages."${system}".default; })
          ];
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

