{ config, ... }: {
  programs.bash = {
    enable = true;

    profileExtra = ''
      if [ -f ${config.home.homeDirectory}/.secrets ]; then
        . ${config.home.homeDirectory}/.secrets
      fi

      if [ -d "${config.home.homeDirectory}/bin" ] ; then
          export PATH="$HOME/bin:$PATH"
      fi

      if [ -d "${config.home.homeDirectory}/.local/bin" ] ; then
          export PATH="$HOME/.local/bin:$PATH"
      fi
    '';

    initExtra = ''
      . "${config.xdg.configHome}/asdf-direnv/bashrc"

      eval "$(register-python-argcomplete pipx)"

      if [ -f ~/.secrets ]; then
        . ~/.secrets
      fi
    '';
  };
}
