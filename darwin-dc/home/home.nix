{
  home.stateVersion = "26.05";

  # Work identity by default; ~/repos/<host>/ahrzb/ switches git, gh and omp to personal.
  identity.default = "work";

  programs = {
    ghostty.enable = true;
    gh.enable = true;
    # `assume <profile>`; generate ~/.aws/config profiles with `granted sso populate`.
    granted.enable = true;
    omp.enable = true;
    k9s.enable = true;
  };
}
