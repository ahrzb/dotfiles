{
  programs.git = {
    enable = true;
    lfs.enable = true;

    ignores = [
      ".DS_Store"
      ".vscode/"
      ".devcontainer/"
      ".idea/"
      ".envrc"
      ".tool-versions"
      "*~"
    ];

    settings = {
      user = {
        name = "AmirHossein Roozbahani";
        # No global email: outside ~/repos/<host>/ commits fail instead of using the wrong identity (see identity.nix).
        useConfigOnly = true;
      };
      alias = {
        co = "checkout";
        lg = "log --oneline --decorate --graph";
      };
      push.autoSetupRemote = true;
    };
  };
}
