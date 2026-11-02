{
  # Casks Homebrew doesn't ship, kept in this repo (tap `ahrzb/local`).
  nix-homebrew = {
    taps."ahrzb/homebrew-local" = builtins.path {
      path = ../homebrew-tap;
      name = "homebrew-local";
    };
    trust.casks = [ "ahrzb/local/dr-sprinto" ];
  };

  homebrew = {
    # Work machine: remove undeclared casks but keep their app data.
    onActivation.cleanup = "uninstall";

    # Listed so `brew bundle cleanup` doesn't untap it.
    taps = [ "ahrzb/local" ];

    casks = [
      "1password"
      "claude"
      "docker-desktop"
      "firefox"
      "ghostty"
      "google-chrome"
      "helium-browser"
      # Missive is deployed by Fleet (root-owned); brew bundle fails on the existing app.
      "notion"
      "raycast"
      "slack"
      "spotify"
      "visual-studio-code"
      "vorssaint"
      "zed"
      # Sprinto compliance agent (SOC 2 device checks)
      "ahrzb/local/dr-sprinto"
    ];
  };
}
