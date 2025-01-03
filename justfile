sync:
  #!/bin/sh
  case "`hostname`" in
    PF3ERKBZ|PF4A8QR9) nix run .#home-manager -- switch --flake . ;;
    rapture) nixos-rebuild switch --flake . ;;
    AmirHosseinsAir*) nix run .#darwin-rebuild -- switch --flake . ;;
  esac
