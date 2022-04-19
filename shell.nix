{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  buildInputs = with pkgs; [ shellcheck nix-linter nixpkgs-fmt pre-commit ];
}
