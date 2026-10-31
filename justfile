host := `hostname -s`

# Build this machine's configuration without activating it
build:
  #!/bin/sh
  set -eu
  case "{{host}}" in
    rapture) nixos-rebuild build --flake .#rapture ;;
    MacBookAir) darwin-rebuild build --flake .#AmirHosseins-MacBook-Air ;;
    dc-ahrzb-mbp) darwin-rebuild build --flake .#dc-ahrzb-mbp ;;
    *) echo "build: no configuration for host {{host}}" >&2; exit 1 ;;
  esac

# Build and activate this machine's configuration
sync:
  #!/bin/sh
  set -eu
  case "{{host}}" in
    rapture) nixos-rebuild switch --sudo --flake .#rapture ;;
    MacBookAir) sudo darwin-rebuild switch --flake .#AmirHosseins-MacBook-Air ;;
    dc-ahrzb-mbp) sudo darwin-rebuild switch --flake .#dc-ahrzb-mbp ;;
    *) echo "sync: no configuration for host {{host}}" >&2; exit 1 ;;
  esac

# Bump all flake inputs
update:
  nix flake update
