### Setup

Apple Silicon MacBook Air, nix-darwin + home-manager.

```bash
# Build and bootstrap (afterwards use `just sync`)
nix build .#darwinConfigurations.AmirHosseins-MacBook-Air.system
sudo ./result/sw/bin/darwin-rebuild switch --flake .#AmirHosseins-MacBook-Air
```
