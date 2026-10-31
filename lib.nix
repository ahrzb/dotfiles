{
  nixpkgs,
  nix-darwin,
  home-manager,
  nix-homebrew,
  ...
}@inputs:
let
  specialArgs = { inherit inputs; };
in
{
  mkDarwin =
    host:
    nix-darwin.lib.darwinSystem {
      inherit specialArgs;
      modules = [
        home-manager.darwinModules.home-manager
        nix-homebrew.darwinModules.nix-homebrew
        ./common/system.nix
        ./common/darwin.nix
        host
      ];
    };

  mkNixos =
    host:
    nixpkgs.lib.nixosSystem {
      inherit specialArgs;
      modules = [
        home-manager.nixosModules.home-manager
        ./common/system.nix
        host
      ];
    };
}
