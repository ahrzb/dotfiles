{ nixpkgs, pre-commit-hooks, flake-utils, home-manager, nix-darwin, ... }:
flake-utils.lib.eachDefaultSystem (system:
let
  pkgs = nixpkgs.legacyPackages.${system};
  pre-commit = pre-commit-hooks.lib.${system}.run {
    src = ./.;
    hooks.nixpkgs-fmt.enable = true;
  };
in
{
  checks.pre-commit-check = pre-commit;
  devShell = pkgs.mkShell {
    inherit (pre-commit) shellHook;
    buildInputs = with pkgs; [ nixpkgs-fmt statix elvish ];
  };
  formatter = pkgs.nixpkgs-fmt;
  apps.home-manager = {
    type = "app";
    program = "${home-manager.packages.${system}.home-manager}/bin/home-manager";
  };
  apps.darwin-rebuild = {
    type = "app";
    program = "${nix-darwin.packages.${system}.darwin-rebuild}/bin/darwin-rebuild";
  };
})
