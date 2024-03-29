{
  description = "AmirHossein's darwin system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-21.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { darwin, home-manager, ... }@inputs:
    let
      inherit (darwin.lib) darwinSystem;
      inherit (inputs.nixpkgs-unstable.lib) attrValues optionalAttrs singleton;
      nixpkgsConfig = {
        config = { allowUnfree = true; };
        overlays = attrValues overlays;
      };
      overlays = {
        extra-pkgs = _final: _prev: {
          pkgs-stable =
            import inputs.nixpkgs { inherit (nixpkgsConfig) config; };
        };
      };
    in
    {
      darwinConfigurations = {
        "C02G108AML86" = darwinSystem {
          system = "x86_64-darwin";
          modules = [
            ./darwin
            home-manager.darwinModules.home-manager
            {
              nixpkgs = nixpkgsConfig;
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users."a.roozbahani" = {
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
                    path = inputs.nixpkgs-unstable;
                    type = "path";
                  };
                };
              };
            }
          ];
        };
      };
    };
}
