{ pkgs, ... }:
{
  # Global tools only; project toolchains belong in each repo's devenv.nix.
  home.packages = with pkgs; [
    # AWS
    awscli2

    # IaC
    opentofu
    terraform
    terraform-ls

    # Kubernetes
    kubectl
    kubernetes-helm

    # Languages
    go
    nodejs
    pnpm
    rustup
    uv

    # DataChef project environments (Inception templates)
    devenv
  ];
}
