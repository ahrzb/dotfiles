{ pkgs, ... }: {
  home = {
    stateVersion = "22.05";
    username = "a.roozbahani";
    homeDirectory = "/home/a.roozbahani";
    sessionVariables = {
      LANG = "en_US.UTF-8";
      LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ]}";
    };
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
    zsh.enable = true;
    neovim.enable = true;
    awscli.enable = true;
    htop.enable = true;
    starship.enable = true;
    zoxide.enable = true;
    skim.enable = true;
    bat.enable = true;
    broot.enable = true;
    gh.enable = true;
    go.enable = true;
    jq.enable = true;
    k9s.enable = true;
    ssh.enable = true;

    eza = {
      enable = true;
      enableAliases = true;
    };

    direnv = {
      enable = true;
      nix-direnv = { enable = true; };
    };
  };

  deliveryhero = {
    disableKubeConfigEnv = true;
    logisticsConsolidatedConfig = {
      enable = false;
      logisticsKubernetesRev = "05145624401662c2a8de89b8fb11bbe8c64d7db6";
    };
    logisticsSaml2awsConfig = {
      enable = true;
      logisticsTerraformRev = "b308d8b426ff864c3c9da9562e9c94b750ff663a";
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
