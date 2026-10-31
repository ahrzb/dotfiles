{ pkgs, ... }:
{
  # Global tools only; project toolchains belong in each repo's devenv.nix.
  home.packages = with pkgs; [
    # AWS
    awscli2

    # Google Cloud; the GKE plugin lets kubectl authenticate to GKE clusters
    (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])

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
