{ pkgs, ... }:
let
  zinit_home = pkgs.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "c703290fc22839bc799790798460bbe850ce9688";
    sha256 = "sha256-QWo4WX3yBO3oOs9DkhYCUB8RjfqPFZwifw4VId1TXUQ=";
  };
in
{
  programs.zsh = {
    enable = true;
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
