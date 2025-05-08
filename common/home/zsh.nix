{ pkgs, lib, ... }:
let
  zinit_home = pkgs.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "c3469496455ea8b8ba184426c558e54817825bef";
    sha256 = "sha256-ck+ifrf8wSIIzBEnbWrw52X1CY5Y0L1GIizsnr1+/w8=";
  };
in
{
  programs.zsh = {
    initContent = lib.mkOrder 550 ''
      [[ -f $HOME/.secrets ]] && source $HOME/.secrets

      export ZINIT_HOME="${zinit_home}"
      source "${zinit_home}/zinit.zsh"

      zinit snippet OMZL::clipboard.zsh
      zinit snippet OMZL::termsupport.zsh 

      zinit snippet OMZ::plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
      zinit snippet OMZ::plugins/git/git.plugin.zsh
      zinit snippet OMZ::plugins/aws/aws.plugin.zsh
      zinit snippet OMZ::plugins/brew/brew.plugin.zsh
      zinit snippet OMZ::plugins/pip/pip.plugin.zsh
      zinit snippet OMZ::plugins/python/python.plugin.zsh
      zinit snippet OMZ::plugins/golang/golang.plugin.zsh
      zinit snippet OMZ::plugins/docker/docker.plugin.zsh
      zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh

      zinit load "zsh-users/zsh-syntax-highlighting"
    '';
    oh-my-zsh.enable = true;
  };
}
