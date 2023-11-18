{ nixpkgs, pre-commit-hooks, flake-utils, ... }:
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
})
