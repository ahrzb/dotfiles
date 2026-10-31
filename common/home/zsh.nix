{ lib, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    # Plugins come from the pinned nixpkgs oh-my-zsh; nothing is fetched at shell startup.
    oh-my-zsh = {
      enable = true;
      plugins = [
        "aws"
        "docker"
        "docker-compose"
        "git"
        "golang"
        "pip"
        "python"
        "zsh-interactive-cd"
      ]
      ++ lib.optional pkgs.stdenv.hostPlatform.isDarwin "brew";
    };
  };
}
