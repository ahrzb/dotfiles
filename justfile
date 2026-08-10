sync:
  #!/bin/sh
  case "`hostname -s`" in
    PF3ERKBZ|PF4A8QR9) nix run .#home-manager -- switch --flake . ;;
    rapture) nixos-rebuild switch --flake . ;;
    MacBookAir) nix run .#darwin-rebuild -- switch --flake .#AmirHosseins-MacBook-Air ;;
    *) echo "sync: no configuration for host `hostname -s`" >&2; exit 1 ;;
  esac
