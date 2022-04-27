{ config, pkgs, lib, ... }:

{
  imports = [ ./modules ./home.nix ./packages.nix ./zsh.nix ./python.nix ];
}
