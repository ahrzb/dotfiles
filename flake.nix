{
  description = "AmirHossein's setups";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
  };
  outputs = { self, nixpkgs, pre-commit-hooks, flake-utils, ... }@inputs:
    let
      inherit (nixpkgs.lib) foldl recursiveUpdate pipe;
      entrypoints = [
        ./devshell.nix
        ./darwin-air
        ./rapture
      ];
    in
    foldl (outputs: path: recursiveUpdate outputs (import path inputs)) { } entrypoints;
}
