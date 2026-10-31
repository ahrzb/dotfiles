# Enabled on every host: cli, git, neovim, ssh, zsh.
# Opt-in per host (`programs.<name>.enable = true`): kitty.
{
  imports = [
    ./cli.nix
    ./git.nix
    ./kitty.nix
    ./neovim.nix
    ./ssh.nix
    ./zsh.nix
  ];
}
