### My dotfiles
* [PC - NixOS](./rapture/README.md)
* [Laptop - Darwin](./darwin-air/README.md)
* [Work (DataChef) - Darwin](./darwin-dc/README.md)

Shared configuration lives in `common/`: `system.nix` (NixOS + darwin), `darwin.nix`, and `home/` (home-manager, imported by every host).

`just build` builds this machine's configuration, `just sync` activates it.
