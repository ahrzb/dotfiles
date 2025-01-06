{ nixpkgs, ghostty, nixgl, emacs-overlay, ... }@inputs:
let
  system = "x86_64-linux";
  overlays = {
    emacs-overlay = import emacs-overlay;
    packages-overlay = (self: super: {
      ghostty = ghostty.packages."${system}".default;
      nixGLIntel = nixgl.packages."${system}".nixGLIntel;
    });
  };
in
{
  homeConfigurations."a.roozbahani@PF3ERKBZ" =
    inputs.home-manager.lib.homeManagerConfiguration {
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
      extraSpecialArgs = { overlays = nixpkgs.lib.attrValues overlays; };
    };
  homeConfigurations."a.roozbahani@PF4A8QR9" =
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ../common/home
        ./home.nix
        ./packages.nix
        ./bash.nix
        ./python.nix
        {
          nixpkgs.overlays = nixpkgs.lib.attrValues overlays;
          nixGL.packages = nixgl.packages;
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
      extraSpecialArgs = { overlays = nixpkgs.lib.attrValues overlays; };
    };
}
