# Enabled on every host: cli, git, identity, neovim, nushell, ssh, zsh.
# Opt-in per host (`programs.<name>.enable = true`): ghostty, kitty, omp.
{
  imports = [
    ./cli.nix
    ./ghostty.nix
    ./git.nix
    ./identity.nix
    ./kitty.nix
    ./neovim.nix
    ./nushell.nix
    ./ssh.nix
    ./zsh.nix
  ];
}
