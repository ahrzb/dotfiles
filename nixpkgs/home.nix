{ pkgs, ... }:

let
  secrets = builtins.fromTOML (builtins.readFile ./conf/secrets.toml);
  sshHosts = builtins.fromTOML (builtins.readFile ./conf/ssh-hosts.toml);
in {
  imports = [ ./modules/shadowsocks-client-service.nix ];

  programs.home-manager.enable = true;
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerdfonts;
      name = "Fira Code";
    };
    settings = {
      font_size = 14;
      enable_audio_bell = false;
      background_opacity = "0.9";
    };
  };
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "avit";
    };
    shellAliases = {
      r = ''
        cd "$HOME/repos/$(ls ~/repos | fzf)";
      '';
    };
  };
  programs.git = {
    enable = true;
    userName = "Amirhossein Rouzbahani";
    userEmail = "ahrzb@cafebazaar.ir";
    aliases = {
      co = "checkout";
      unstage = "reset HEAD --";
    };
    extraConfig = {
      core.editor = "${pkgs.neovim}/bin/nvim";
      credential.helper = "store";
    };
  };
  programs.ssh = {
    enable = true;

    matchBlocks = sshHosts;

    extraConfig = ''
      AddKeysToAgent yes
    '';
  };
  programs.firefox = {
    enable = true;
    enableAdobeFlash = true;
  };
  programs.chromium = { enable = true; };
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [ vim-addon-nix ];
  };
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions;
      [
        ms-python.python
        ms-vscode-remote.remote-ssh
        ms-kubernetes-tools.vscode-kubernetes-tools
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "gc-excelviewer";
          publisher = "GrapeCity";
          version = "3.0.39";
          sha256 = "1c2pd7lib6plxd1hs6ry3vag1cp8ym6qn09dijqsav04p9787ph8";
        }
        {
          name = "nix-env-selector";
          publisher = "arrterian";
          version = "0.1.2";
          sha256 = "1n5ilw1k29km9b0yzfd32m8gvwa2xhh6156d4dys6l8sbfpp2cv9";
        }
        {
          name = "Nix";
          publisher = "bbenoist";
          version = "1.0.1";
          sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
        }
      ];
  };
  programs.emacs.enable = true;
  programs.jq.enable = true;
  programs.bat.enable = true;
  programs.aria2.enable = true;
  programs.fzf.enable = true;
  programs.htop.enable = true;
  programs.man.enable = true;
  programs.direnv.enable = true;
  programs.dircolors.enable = true;
  programs.go.enable = true;

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
  services.shadowsocks-client = {
    enable = true;
    server = "${secrets.shadowsocks.server}";
    server_port = "${secrets.shadowsocks.server_port}";
    password = "${secrets.shadowsocks.password}";
    plugin = "${pkgs.shadowsocks-v2ray-plugin}/bin/v2ray-plugin";
    method = "${secrets.shadowsocks.method}";
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ahrzb";
  home.homeDirectory = "/home/ahrzb";
  home.packages = with pkgs; [
    vlc
    tdesktop
    spotify
    jetbrains.idea-community
    texlive.combined.scheme-full
    inkscape
    calibre

    steam
    warzone2100

    kdeApplications.ksudoku
    kdeApplications.okular
    kdeApplications.ark
    kdeApplications.kate
    kdeApplications.kcalc
    kdeApplications.spectacle
    kdeApplications.gwenview

    (python3.withPackages (ps:
      with ps; [
        virtualenv
        ipython
        jupyter
        ipywidgets
        numpy
        pandas
        spacy
        thinc
        scikitlearn
        pytorch
        joblib
        tqdm
        pydub
        matplotlib
        seaborn
        boto3
        beautifulsoup4
        requests
        PyHTML
      ]))
    nodejs
    clojure
    leiningen
    kubectl
    dvc

    docker-compose
    vagrant

    gron
    pup
    csvkit

    httpie
    s3cmd

    ranger
    sshfs
    mosh
    hyperfine
    parallel
    pv
    ripgrep
    fd
    entr
    byobu
    rsync
    ffmpeg
    ansible
    gcc
    tree

    nixfmt
    nix-prefetch-git

    pandoc
    k2pdfopt
    briss

    iosevka
    samim-fonts
    vazir-fonts
    shabnam-fonts
    sahel-fonts
    parastoo-fonts
    emacs-all-the-icons-fonts

    (pkgs.writeShellScriptBin "chatterbox" ''
      	    export LD_LIBRARY_PATH="${
             pkgs.lib.makeLibraryPath [ stdenv.cc.cc pkgs.libsndfile ]
           }"
            	    export TTS_API_KEY="${secrets.negar.api-key}"
            	    export TTS_API_SECRET="${secrets.negar.api-secret}"
            	    ~/repos/chatterbox/client/venv/bin/chatterbox $@
            	'')
    (pkgs.writeShellScriptBin "negar-client" ''
      	    export LD_LIBRARY_PATH="${
             pkgs.lib.makeLibraryPath [ stdenv.cc.cc pkgs.libsndfile ]
           }"
            	    export NEGAR_API_KEY="${secrets.chatterbox.api-key}"
            	    export NEGAR_API_SECRET="${secrets.chatterbox.api-secret}"
                        ~/repos/negar-grpc/venv/bin/negar-client $@
            	'')
    (pkgs.writeShellScriptBin "csv2listen" ''
      ~/repos/csv2listen/venv/bin/csv2listen $@
    '')
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}

