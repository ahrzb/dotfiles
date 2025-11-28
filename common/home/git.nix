{
  programs = {
    git = {
      aliases = {
        co = "checkout";
        lg = "log --oneline --decorate --graph";
      };
      extraConfig = {
        core.excludesfile = "${./git.global.gitignore}";
        push.autoSetupRemote = true;
      };
      includes = [
        {
          path = ./git.deliveryhero.gitconfig;
          condition = "gitdir:~/repos/github.com/deliveryhero/**";
        }
        {
          path = ./git.personal.gitconfig;
          condition = "gitdir:~/repos/github.com/**";
        }
        {
          path = ./git.personal.gitconfig;
          condition = "gitdir:~/repos/gitlab.com/**";
        }
        {
          path = ./git.personal.gitconfig;
          condition = "gitdir:~/repos/codeberg.org/**";
        }
      ];
    };
  };
}
