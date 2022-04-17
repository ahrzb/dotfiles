#!/bin/sh

# Refer to https://github.com/nix-community/home-manager/#installation
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
