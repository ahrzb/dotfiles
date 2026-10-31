### DataChef MacBook Pro (`dc-ahrzb-mbp`)

Apple Silicon, nix-darwin + home-manager. Homebrew itself is installed by `nix-homebrew`; casks are declared in `darwin/homebrew.nix`.

#### Bootstrap

```bash
# 1. Nix: https://github.com/NixOS/nix-installer (flakes enabled by default)

# 2. Hand /etc files written by the installer over to nix-darwin
sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.before-nix-darwin
sudo mv /etc/nix/nix.custom.conf /etc/nix/nix.custom.conf.before-nix-darwin
for f in /etc/zshrc /etc/bashrc /etc/zshenv; do
  [ -e "$f" ] && sudo mv "$f" "$f.before-nix-darwin"
done

# 3. First activation (afterwards `darwin-rebuild` is on PATH; use `just sync`)
nix build .#darwinConfigurations.dc-ahrzb-mbp.system
sudo ./result/sw/bin/darwin-rebuild switch --flake .#dc-ahrzb-mbp
```

#### After first switch

* 1Password: enable *Settings → Developer → Use the SSH agent* and *Integrate with 1Password CLI*. SSH uses the 1Password agent for every host.
* AWS: `granted sso populate --sso-region <region> <start-url>` writes `~/.aws/config` profiles; switch with `assume <profile>`.
* GitHub: `gh auth login`. Repos under `~/repos/github.com/DataChefHQ/` commit as the DataChef identity; anywhere outside `~/repos/<host>/`, git refuses to commit (no global email).
* Projects: DataChef repos use devenv + direnv; run `direnv allow` once per repo.
