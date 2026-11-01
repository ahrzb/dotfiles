# Interactive shell. zsh stays the login shell: it builds the environment (nix-darwin PATH,
# home-manager session variables) that nu inherits; see `command` in ghostty.nix.
{ config, lib, ... }:
{
  programs.nushell = {
    enable = true;
    settings.show_banner = false;
    # zsh already exports the session environment before exec'ing nu.
    loadSessionVariables = false;
    extraConfig = lib.mkIf config.programs.granted.enable (builtins.readFile ./assume.nu);
  };

  # External command completions for nu; zsh keeps its own completion system.
  programs.carapace = {
    enable = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
    enableZshIntegration = false;
  };
}
