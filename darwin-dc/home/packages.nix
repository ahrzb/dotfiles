{ pkgs, ... }:
{
  # Global tools only; project toolchains belong in each repo's devenv.nix.
  home.packages = with pkgs; [
    # AWS
    awscli2

    # Google Cloud; the GKE plugin lets kubectl authenticate to GKE clusters
    (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])

    # Google Workspace (Drive, Gmail, Calendar, Sheets, …); `gws auth setup` needs gcloud logged in
    gws

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
    # Shadows Apple's /usr/bin/python3 and pip3 stubs: the Command Line Tools are uninstalled
    # (their bundled Python 3.9 fails Fleet's vulnerability scan), and agents call both.
    (python3.withPackages (ps: [ ps.pip ]))
    rustup
    uv
  ];
}
