{ nixpkgs, emacs-overlay, ... }@inputs:
let
  overlays = {
    emacs-overlay = import emacs-overlay;
  };
in
{
  homeConfigurations."a.roozbahani@PF3ERKBZ" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      ../common/home
      ./home.nix
      ./packages.nix
      ./bash.nix
      ./python.nix
      {
        nixpkgs.overlays = nixpkgs.lib.attrValues overlays;
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
    extraSpecialArgs = {
      overlays = nixpkgs.lib.attrValues overlays;
      nixpkgs = overlays;
    };
  };
}
