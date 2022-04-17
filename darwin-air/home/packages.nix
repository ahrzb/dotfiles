{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    coreutils
    curl
    wget
    xz
    tree
    aria2
    fd
    fzf
    mosh

    kubernetes-helm
    helmfile
    terraform

    git
    httpie
    jq
    go_1_17
    rustup

    statix
    nixfmt
    nix-diff

    m-cli
  ];
}
