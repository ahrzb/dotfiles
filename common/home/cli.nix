{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    coreutils
    curl
    fd
    httpie
    jq
    just
    mosh
    nix-diff
    ripgrep
    statix
    tree
    wget
    xz
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fzf.enable = true;

    # Prebuilt nixpkgs file index: `nix-locate`, command-not-found suggestions,
    # and `, <cmd>` to run any nixpkgs command without installing it.
    nix-index.enable = true;
    nix-index-database.comma.enable = true;

    htop = {
      enable = true;
      settings.show_program_path = true;
    };

    zoxide.enable = true;

    starship = {
      enable = true;
      settings = {
        aws.style = "bold #ffb86c";
        cmd_duration.style = "bold #f1fa8c";
        directory.style = "bold #50fa7b";
        hostname.style = "bold #ff5555";
        git_branch.style = "bold #ff79c6";
        git_status.style = "bold #ff5555";
        username = {
          format = "[$user]($style) on ";
          style_user = "bold #bd93f9";
        };
        character = {
          success_symbol = "[λ](bold #f8f8f2)";
          error_symbol = "[λ](bold #ff5555)";
        };
      };
    };
  };
}
