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
* Identities: work by default under `~/repos/<host>/`; `~/repos/<host>/ahrzb/` is personal. That switches the git email, the gh account (`~/.config/gh-personal`, also used by git for HTTPS pushes) and the omp profile (`~/.omp/profiles/personal`). Outside `~/repos/<host>/`, git refuses to commit (no global email).
  * GitHub: `gh auth login` anywhere for the work account, and once more from inside `~/repos/github.com/ahrzb/` for the personal one.
  * omp: log in once in each place the same way.
  * omp browser relay (lets omp drive your logged-in Chrome tabs): run `omp browser-relay install` from `~`, then in Chrome open `chrome://extensions`, enable *Developer mode*, *Load unpacked* `~/.omp/browser-relay/extension`. One extension serves both profiles; set `omp config set browser.relay true` in each (from `~` and from inside `~/repos/github.com/ahrzb/`).
* Shell: Ghostty starts a login zsh (environment) that execs nushell. `assume` works in nu too.
* Projects: DataChef repos use devenv + direnv; run `direnv allow` once per repo.
* Building omp: it isn't in any binary cache, so the first build compiles it (about 15 min on this machine).
