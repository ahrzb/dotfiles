### Setup

Started with [jmatsushita's example][jmatsushita] and made it more tidy and suited to my needs.
The configuration is written with the assumption that the system is a darwin-aarch64.

```bash
# Install nix (at the time of writing this is version 2.7.0
curl -L https://nixos.org/nix/install | sh

# Build and boostrap
nix build .#darwin-air#darwinConfigurations."AmirHosseins-MacBook-Air".system
./result/sw/bin/darwin-rebuild switch --flake .
```

[jmatsushita]: https://discourse.nixos.org/t/simple-workable-config-for-m1-macbook-pro-monterey-12-0-1-with-nix-flakes-nix-darwin-and-home-manager/16834