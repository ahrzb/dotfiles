### My dotfiles
* [PC - NixOS](./rapture/README.md)
* [Laptop - Darwin](./darwin-air/README.md)
* [Work (DataChef) - Darwin](./darwin-dc/README.md)

Shared configuration lives in `common/`: `system.nix` (NixOS + darwin), `darwin.nix`, and `home/` (home-manager, imported by every host).

`just build` builds this machine's configuration, `just sync` activates it.

A weekly GitHub Action runs `nix flake update` and opens an `update-flake-lock` PR once the darwin hosts build; merge it, pull, then `just sync`. The darwin hosts collect garbage daily (generations older than 7 days).
