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
    htop.enable = true;
    starship.enable = true;
    zoxide.enable = true;
    skim.enable = true;
    atuin.enable = true;
    bat.enable = true;
    broot.enable = true;
    gh.enable = true;
    go.enable = true;
    jq.enable = true;
    k9s.enable = true;
    ssh.enable = true;

    eza = {
      enable = true;
      enableBashIntegration = true;
    };

    direnv = {
      enable = true;
      nix-direnv = { enable = true; };
    };
  };

  deliveryhero = {
    disableKubeConfigEnv = false;
    logisticsConsolidatedConfig = {
      enable = false;
      logisticsKubernetesRev = "05145624401662c2a8de89b8fb11bbe8c64d7db6";
    };
    logisticsSaml2awsConfig = {
      enable = false;
      logisticsTerraformRev = "4445f716268bb22aad9619d5fd2e32fda8c816d8";
    };
  };

  services = {
    safeeyes.enable = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
