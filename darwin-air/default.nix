{ nixpkgs, nix-darwin, home-manager, ... }:
let
  inherit (nix-darwin.lib) darwinSystem;
  inherit (nixpkgs.lib) attrValues optionalAttrs singleton;
  nixpkgsConfig = {
    config = { allowUnfree = true; };
    overlays = attrValues overlays
      ++ singleton (final: _prev: { inherit (final.pkgs-x86) nix-index; });
  };
  overlays = {
    extra-pkgs = _final: _prev: {
      pkgs-x86 = import nixpkgs {
        system = "x86_64-darwin";
        config = nixpkgsConfig.config // { allowUnsupportedSystem = true; };
      };
    };
  };
  home-manager-config = {
    nixpkgs = nixpkgsConfig;
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.ahrzb = { ... }: { imports = [ ./home ../common/home ]; };
    };
  };
  registry = {
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
  };
in
{
  darwinConfigurations."AmirHosseins-MacBook-Air" = darwinSystem {
    system = "aarch64-darwin";
    modules = [ ./darwin home-manager.darwinModules.home-manager home-manager-config registry ];
  };
}
