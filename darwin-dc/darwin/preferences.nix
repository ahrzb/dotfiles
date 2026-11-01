{
  system = {
    stateVersion = 7;
    primaryUser = "ahrzb";
  };

  # `op` in /usr/local/bin: the only path the 1Password app trusts for CLI integration.
  programs._1password.enable = true;

  # Sprinto (Dr. Sprinto) checks that the firewall is on.
  networking.applicationFirewall = {
    enable = true;
    enableStealthMode = true;
  };
}
