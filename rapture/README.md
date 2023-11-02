## Rapture

### Installation

```sh
# install nixos system
sudo nixos-rebuild switch --flake .

# install home-manager
nix run .#sync
# or alternatively install home-manager and run
home-manager switch --flake .
```
