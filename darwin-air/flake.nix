{
  description = "AmirHossein's darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";

    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  };

  outputs = { nixpkgs, darwin, home-manager, nix-doom-emacs, ... }@inputs:
    let
      inherit (darwin.lib) darwinSystem;
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
      system = darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./darwin

          home-manager.darwinModules.home-manager
          {
            nixpkgs = nixpkgsConfig;
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.ahrzb = { ... }: {
                imports = [ nix-doom-emacs.hmModule ./home ];
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
    in
    {
      darwinConfigurations = { "AmirHosseinsAir" = system; };

      formatter.aarch64-darwin =
        inputs.nixpkgs.legacyPackages.aarch64-darwin.nixfmt;

      sys = system;

      apps.aarch64-darwin.sync = {
        type = "app";
        program = "${system.system}/activate";
      };
    };
}
