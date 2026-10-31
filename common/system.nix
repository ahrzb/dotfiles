# Shared by NixOS and nix-darwin hosts.
{ inputs, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # `nixpkgs` is registered automatically; `pkgs` is a shorter alias, e.g. `nix shell pkgs#jq`.
  nix.registry.pkgs.flake = inputs.nixpkgs;

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [ inputs.omp.overlays.default ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    sharedModules = [
      inputs.omp.homeManagerModules.default
      ./home
    ];
  };
}
