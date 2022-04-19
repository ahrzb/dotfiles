### Setup

```bash
# Install nix (at the time of writing this is version 2.7.0
curl -L https://nixos.org/nix/install | sh

# Build and boostrap
nix build .#darwin-air#darwinConfigurations."C02G108AML86".system
./result/sw/bin/darwin-rebuild switch --flake .
```