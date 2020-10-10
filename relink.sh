#!/bin/sh

cd "$(dirname "$0")" || {
  echo "Can not cd to script directory, exitting";
  exit 1;
}

ln --no-target-directory --symbolic "$PWD/nixpkgs" "$HOME/.config/nixpkgs"
ln --no-target-directory --symbolic "$PWD/doom.d" "$HOME/.doom.d"

