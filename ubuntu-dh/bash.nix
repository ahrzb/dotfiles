{ pkgs, config, ... }:
let
  qfc_root = pkgs.fetchFromGitHub {
    owner = "pindexis";
    repo = "qfc";
    rev = "3ed9e530af70a1ce9c6b23abb10c5f7617217494";
    sha256 = "sha256-Ir30u9mGEEaF7iBbxu0cn0Q+07DmkpKnNnLJdOy7R58=";
  };
in {
  programs.bash = {
    enable = true;

    profileExtra = ''
      if [ -f ${config.home.homeDirectory}/.secrets ]; then
        . ${config.home.homeDirectory}/.secrets
      fi

      if [ -d "${config.home.homeDirectory}/bin" ] ; then
          PATH="$HOME/bin:$PATH"
      fi

      if [ -d "${config.home.homeDirectory}/.local/bin" ] ; then
          PATH="$HOME/.local/bin:$PATH"
      fi
    '';

    initExtra = ''
      . "${config.xdg.configHome}/asdf-direnv/bashrc"
      . "${qfc_root}/bin/qfc.sh"
      eval "$(register-python-argcomplete pipx)"
    '';
  };
}
