{ pkgs, nixgl, ... }: {
  home = {
    stateVersion = "22.05";
    username = "a.roozbahani";
    homeDirectory = "/home/a.roozbahani";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      LANG = "en_US.UTF-8";
      LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ]}";
    };
  };

  xdg = { userDirs = { enable = true; }; };

  programs = {
    home-manager.enable = true;
    git.enable = true;
    zsh.enable = true;
    zsh.initExtra = ''
      function gdp-access() {
        eval "$(dp-devinfra destinations access --export-env-vars "$1" "$2" "$3")"
      }

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
    '';
    neovim.enable = true;
    htop.enable = true;
    starship.enable = true;
    zoxide.enable = true;
    skim.enable = true;
    atuin.enable = true;
    bat.enable = true;
    broot.enable = true;
    gh.enable = true;
    go.enable = true;
    jq.enable = true;
    k9s.enable = true;
    ssh.enable = true;

    eza = {
      enable = true;
      enableBashIntegration = true;
    };

    direnv = {
      enable = true;
      nix-direnv = { enable = true; };
    };
  };

  deliveryhero = {
    disableKubeConfigEnv = false;
    logisticsConsolidatedConfig = {
      enable = false;
      logisticsKubernetesRev = "05145624401662c2a8de89b8fb11bbe8c64d7db6";
    };
    logisticsSaml2awsConfig = {
      enable = false;
      logisticsTerraformRev = "4445f716268bb22aad9619d5fd2e32fda8c816d8";
    };
  };

  services = { safeeyes.enable = true; };

  nixpkgs = { config = { allowUnfree = true; }; };
}
