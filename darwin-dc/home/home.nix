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
    zed-editor.enable = true;
  };

  # Screen saver after 10 idle minutes; the password is already required immediately
  # (`sysadminctl -screenLock status`). Display sleep (pmset) is left at macOS defaults.
  targets.darwin.currentHostDefaults."com.apple.screensaver".idleTime = 600;
}
