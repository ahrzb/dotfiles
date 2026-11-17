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
* AWS: `aws sso login` (one SSO session covers every profile). Profiles live in `home/home.nix` (`programs.awscli`): `default` is the sandbox, `stytch-ro` the read-only internal-automations account. Switch with `assume <profile>` or pass `--profile`.
* Datadog (`pup`): `pup auth login` (browser OAuth; set `DD_SITE`, e.g. `datadoghq.eu`, if the org isn't on `datadoghq.com`).
* Google Cloud: `gcloud auth login` and `gcloud auth application-default login`.
* Google Workspace (`gws`): after gcloud, `gws auth setup` once (creates an OAuth client in a Cloud project), then `gws auth login -s drive,gmail,calendar,sheets,docs`. Credentials are encrypted with a key in the macOS keychain.
* Notion (`ntn`): `ntn login`.
* `pup` and `ntn` aren't in nixpkgs; `home/pkgs/` pins their release binaries, so `nix flake update` doesn't bump them. Update `version` and `hash` there by hand (`ntn update` can't write to the Nix store).
* Identities: work by default under `~/repos/<host>/`; `~/repos/<host>/ahrzb/` is personal. That switches the git email and the omp profile (`~/.omp/profiles/personal`). Outside `~/repos/<host>/`, git refuses to commit (no global email).
  * GitHub: one personal account everywhere (DataChef uses it too); `gh auth login` once. gh is also git's HTTPS credential helper.
  * omp: log in once from `~` (work profile) and once from inside `~/repos/github.com/ahrzb/` (personal profile).
  * omp browser relay (lets omp drive your logged-in Chrome tabs): run `omp browser-relay install` from `~`, then in Chrome open `chrome://extensions`, enable *Developer mode*, *Load unpacked* `~/.omp/browser-relay/extension`. One extension serves both profiles; set `omp config set browser.relay true` in each (from `~` and from inside `~/repos/github.com/ahrzb/`).
  * DataChef Pantry skills (work profile; the Claude org already ships them to Claude Code): from `~`, `omp plugin marketplace add DataChefHQ/datachef-pantry` and `omp plugin install pantry@datachef-pantry`. The catalog has no version, so a plain `omp plugin upgrade` skips it; refresh with `omp plugin marketplace update datachef-pantry && omp plugin upgrade pantry@datachef-pantry`.
* Shell: Ghostty starts a login zsh (environment) that execs nushell. `assume` works in nu too.
* Projects: DataChef repos use devenv. Run `devenv allow` once per repo; then `cd` into it starts `devenv shell` (nushell) and leaving the directory exits it. Don't add a `.envrc` with `use devenv` to those repos, or direnv would load it too. direnv is for flake repos (`use flake`), e.g. this one.
* No Xcode Command Line Tools: their bundled Python 3.9 fails DataChef's Fleet vulnerability scan. Nix supplies git and python3/pip3; compilers come from devenv shells. If macOS offers to install the Command Line Tools (running `/usr/bin/cc`, `make`, `lldb`, …) or Software Update lists them, decline.
* Building omp: it isn't in any binary cache, so the first build compiles it (about 15 min on this machine).
