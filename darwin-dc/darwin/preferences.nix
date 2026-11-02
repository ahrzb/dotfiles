{
  system = {
    stateVersion = 7;
    primaryUser = "ahrzb";
  };

  # `op` in /usr/local/bin: the only path the 1Password app trusts for CLI integration.
  programs._1password.enable = true;

  # Firewall, screen-lock password, guest account and FileVault are enforced by the
  # DataChef Fleet MDM profiles (`system_profiler SPConfigurationProfileDataType`);
  # don't set them here. MDM pins the firewall on with stealth mode off.
}
