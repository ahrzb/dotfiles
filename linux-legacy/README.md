## Setup

OS: [nixos](https://nixos.org) - unstable channel

Username: ahrzb

Setup:

```bash
$ mkdir -p repos
$ git clone https://github.com/ahrzb/dotfiles ~/repos/dotfiles
$ cd ~/repos/dotfiles
$ cp ./nixos/conf/secrets-dummy.toml ./nixos/conf/secrets.toml
$ vim ./nixos/conf/secrets.toml # fill in the secrets
$ vim ./nixos/conf/ssh-hosts.toml # add ssh-hosts
$ ./relink.sh
$ ./install-home-manager.sh
$ ./install-doom-emacs.sh
```

## Development Setup

```bash
$ cd ~/repos/dotfiles
$ direnv allow
$ pre-commit install
```
