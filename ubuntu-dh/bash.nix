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
      source "${config.xdg.configHome}/asdf-direnv/bashrc"

      eval "$(register-python-argcomplete pipx)"

      function dhlogin() {
        mfa="`op item get 54xiseagtbwviz2cyvfm4ppzza --otp`"

        saml2aws login -a log-prd --mfa="TOTP" --mfa-token="$mfa" --force --skip-prompt && \
        saml2aws login -a log-stg --mfa="TOTP" --mfa-token="$mfa" --force --skip-prompt && \
        saml2aws login -a log-shared --mfa="TOTP" --mfa-token="$mfa"  --force --skip-prompt && \
        saml2aws login -a log-dwh-prd --mfa="TOTP" --mfa-token="$mfa" --force --skip-prompt && \
        saml2aws login -a log-prd --mfa="TOTP" --profile gdp-log-prd --mfa-token="$mfa" --force --skip-prompt && \
        saml2aws login -a log-stg --mfa="TOTP" --profile gdp-log-stg --mfa-token="$mfa" --force --skip-prompt && \
        aws --region eu-west-1 ecr get-login-password --profile log-prd | docker login --username AWS --password-stdin "683110685365.dkr.ecr.eu-west-1.amazonaws.com" && \
        aws --region eu-west-1 ecr get-login-password --profile log-stg | docker login --username AWS --password-stdin "940776968316.dkr.ecr.eu-west-1.amazonaws.com" && \
        aws --region eu-west-1 ecr get-login-password --profile log-stg | docker login --username AWS --password-stdin "913464273150.dkr.ecr.eu-west-1.amazonaws.com"
      }

      if [ -f ~/.secrets ]; then
        . ~/.secrets
      fi
    '';
  };
}
