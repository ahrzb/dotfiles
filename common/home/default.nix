# Enabled on every host: cli, git, identity, neovim, nushell, ssh, zsh.
# Opt-in per host (`programs.<name>.enable = true`): ghostty, kitty, omp, zed-editor.
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
    ./zed.nix
    ./zsh.nix
  ];
}
