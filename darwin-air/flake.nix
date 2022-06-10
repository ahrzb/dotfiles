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
        overlays = attrValues overlays
          ++ singleton (_final: _prev: { inherit (final.pkgs-x86) nix-index; });
      };
      overlays = {
        extra-pkgs = _final: _prev: {
          pkgs-x86 = import inputs.nixpkgs-unstable {
            system = "x86_64-darwin";
            config = nixpkgsConfig.config // { allowUnsupportedSystem = true; };
          };
          pkgs-stable =
            import inputs.nixpkgs { inherit (nixpkgsConfig) config; };
          pkgs-stable-x86 = import inputs.nixpkgs {
            system = "x86_64-darwin";
            config = nixpkgsConfig.config // { allowUnsupportedSystem = true; };
          };
        };
      };
    in
    {
      darwinConfigurations = {
        "AmirHosseinsAir" = darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./darwin

            home-manager.darwinModules.home-manager
            {
              nixpkgs = nixpkgsConfig;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ahrzb = import ./home;
            }
          ];
        };
      };
    };
}
