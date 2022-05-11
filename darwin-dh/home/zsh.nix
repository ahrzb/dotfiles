{ config, pkgs, lib, ... }:
let
  zinit_home = pkgs.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "c703290fc22839bc799790798460bbe850ce9688";
    sha256 = "sha256-QWo4WX3yBO3oOs9DkhYCUB8RjfqPFZwifw4VId1TXUQ=";
  };
in {
  programs.zsh = {
    enable = true;
    initExtraFirst = ''
      source ~/.secrets

      function hello-world() {
        ssh-add --apple-use-keychain &&
        eval $(op signin --account my.1password.com) &&
        saml2aws login -a log-prd --mfa-token="$(op item get --otp iam.syslogistics.io)" --skip-prompt &&
        saml2aws login -a log-stg --mfa-token="$(op item get --otp iam.syslogistics.io)" --skip-prompt &&
        saml2aws login -a log-shared --mfa-token="$(op item get --otp iam.syslogistics.io)" --skip-prompt &&
        aws --region eu-west-1 ecr get-login-password --profile log-prd | docker login --username AWS --password-stdin $DH_AWS_ECR_ROOT &&
        echo "Hello World!"
      }
    '';
    shellAliases = {
      ll = "ls -l";

      k-production-ap = "kubectl --kubeconfig $HOME/.kube_tool/production-ap";
      t-production-ap = "KUBECONFIG=$HOME/.kube_tool/production-ap kubetail";
      k9s-production-ap =
        "k9s --readonly --kubeconfig $HOME/.kube_tool/production-ap";

      k-production-tes-ap =
        "kubectl --kubeconfig $HOME/.kube_tool/production-tes-ap";
      t-production-tes-ap =
        "KUBECONFIG=$HOME/.kube_tool/production-tes-ap kubetail";
      k9s-production-tes-k9s =
        "kubectl --kubeconfig $HOME/.kube_tool/production-tes-ap";

      k-production-eu = "kubectl --kubeconfig $HOME/.kube_tool/production-eu";
      t-production-eu = "KUBECONFIG=$HOME/.kube_tool/production-eu kubetail";
      k9s-production-eu =
        "k9s --readonly --kubeconfig $HOME/.kube_tool/production-eu";

      k-production-us = "kubectl --kubeconfig $HOME/.kube_tool/production-us";
      t-production-us = "KUBECONFIG=$HOME/.kube_tool/production-us kubetail";
      k9s-production-us =
        "k9s --readonly --kubeconfig $HOME/.kube_tool/production-us";

      k-production-dwh = "kubectl --kubeconfig $HOME/.kube_tool/production-dwh";
      t-production-dwh = "KUBECONFIG=$HOME/.kube_tool/production-dwh kubetail";
      k9s-production-dwh =
        "k9s --readonly --kubeconfig $HOME/.kube_tool/production-dwh";

      k-staging = "kubectl --kubeconfig $HOME/.kube_tool/staging";
      t-staging = "KUBECONFIG=$HOME/.kube_tool/staging kubetail";
      k9s-staging = "k9s --readonly --kubeconfig $HOME/.kube_tool/staging";

      k-shared-eu =
        "kubectl --kubeconfig $HOME/.kube_tool/production-shared-eu";
      t-shared-eu = "KUEBCONFIG=$HOME/.kube_tool/production-shared-eu kubetail";
      k9s-shared-eu =
        "k9s --readonly --kubeconfig $HOME/.kube_tool/production-shared-eu";

      k-qa = "kubectl --kubeconfig $HOME/.kube_tool/qa";
      t-qa = "KUBECONFIG=$HOME/.kube_tool/qa kubetail";
      k9s-qa = "k9s --readonly --kubeconfig $HOME/.kube_tool/qa";

      k-argo =
        "kubectl --kubeconfig '$HOME/.kube/config' --context eu01-infra01 --namespace argo-workflows";
      t-argo =
        "KUBECONFIG=$HOME/.kube/config kubetail --context eu01-infra01 --namespace argo-workflows";

      k-airflow-stg =
        "kubectl --kubeconfig $HOME/.kube_tool/staging-eu -namespace log-ds";
      t-airflow-stg =
        "KUBECONFIG=$HOME/.kube_tool/staging-eu kubetail -namespace log-ds";

      argo = "env KUBECONFIG=$HOME/.kube/config argo";
      helmfile = "env KUBECONFIG=$HOME/.kube/config helmfile";
      k9ss = ''
        k9s --readonly --kubeconfig "$HOME/.kube_tool/$(ls $HOME/.kube_tool | fzf)"'';
      hello-argo =
        "export ARGO_TOKEN=$(env ARGO_TOKEN='' argo auth --context eu01-infra01 token)";
    };
    initExtraBeforeCompInit = ''
      export ZINIT_HOME="${zinit_home}"
      source "${zinit_home}/zinit.zsh"
      zinit snippet OMZ::plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
      zinit snippet OMZ::plugins/git/git.plugin.zsh
      zinit snippet OMZ::plugins/aws/aws.plugin.zsh
      zinit snippet OMZ::plugins/brew/brew.plugin.zsh
      zinit snippet OMZ::plugins/pip/pip.plugin.zsh
      zinit snippet OMZ::plugins/python/python.plugin.zsh
      zinit snippet OMZ::plugins/golang/golang.plugin.zsh
      zinit snippet OMZ::plugins/iterm2/iterm2.plugin.zsh
      zinit snippet OMZ::plugins/vagrant/vagrant.plugin.zsh
      zinit snippet OMZ::plugins/docker/docker.plugin.zsh
      zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh

      zinit load "zsh-users/zsh-syntax-highlighting"
    '';
  };
}
