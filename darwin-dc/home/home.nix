{
  home.stateVersion = "26.05";

  programs = {
    ghostty.enable = true;
    gh.enable = true;
    # `assume <profile>`; generate ~/.aws/config profiles with `granted sso populate`.
    granted.enable = true;
    k9s.enable = true;
  };
}
