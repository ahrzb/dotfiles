{
  home.stateVersion = "26.05";

  # Work identity by default; ~/repos/<host>/ahrzb/ switches the git email and omp to personal.
  identity.default = "work";

  programs = {
    # DataChef project environments (Inception templates). Its cd hook (zsh, nu) spawns
    # `devenv shell` in projects with a devenv.nix once trusted with `devenv allow`.
    devenv.enable = true;
    ghostty.enable = true;
    gh.enable = true;
    # ~/.aws/config (read-only; edit here, not with `aws configure` or `granted sso populate`).
    # One SSO session for every profile: `aws sso login` once, then `assume <profile>` or
    # `--profile`. Roles are the IAM Identity Center permission sets of each account.
    awscli = {
      enable = true;
      settings = {
        "sso-session datachef" = {
          sso_start_url = "https://datachef.awsapps.com/start";
          sso_region = "eu-west-1";
          sso_registration_scopes = "sso:account:access";
        };
        # sandbox-amirhossein.r (aws+sandbox-amirhossein.r@datachef.co)
        default = {
          sso_session = "datachef";
          sso_account_id = "396248155735";
          sso_role_name = "AdminAccess";
          region = "eu-west-1";
        };
        # internal-automations (aws+automations@datachef.co): read-only, plus the Stytch
        # Terraform state (iaai-stytch-config).
        "profile stytch-ro" = {
          sso_session = "datachef";
          sso_account_id = "640721796322";
          sso_role_name = "ReadOnlyWithStytchTfState";
          region = "eu-west-1";
        };
      };
    };
    # `assume <profile>` switches the shell to a profile from ~/.aws/config.
    granted.enable = true;
    omp.enable = true;
    k9s.enable = true;
    zed-editor.enable = true;
  };

  # Screen saver after 10 idle minutes. The MDM password policy caps inactivity at
  # 15 minutes and requires the password immediately, so keep this at or below 900.
  # Display sleep (pmset) is left at macOS defaults.
  targets.darwin.currentHostDefaults."com.apple.screensaver".idleTime = 600;
}
