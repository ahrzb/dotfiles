let
  personal.user.email = "ahrzb5@gmail.com";
  datachef.user.email = "amirhossein.r@datachef.co";
in
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
        # No global email: committing outside ~/repos/<host>/ fails instead of using the wrong identity.
        useConfigOnly = true;
      };
      alias = {
        co = "checkout";
        lg = "log --oneline --decorate --graph";
      };
      push.autoSetupRemote = true;
    };

    # Later includes override earlier ones: catch-all hosts first, specific orgs after.
    includes =
      map
        (host: {
          condition = "gitdir:~/repos/${host}/**";
          contents = personal;
        })
        [
          "github.com"
          "gitlab.com"
          "codeberg.org"
        ]
      ++ [
        {
          condition = "gitdir/i:~/repos/github.com/DataChefHQ/**";
          contents = datachef;
        }
      ];
  };
}
