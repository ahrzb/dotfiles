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
    userEmail = "ahrzb5@gmail.com";
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
  programs.firefox = { enable = true; };
  programs.chromium = { enable = true; };
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-addon-nix
      vim-surround
      vim-commentary
      vim-indent-object
    ];
  };
  programs.vscode = {
    enable = true;
    userSettings = {
      "python.defaultInterpreterPath" = "/home/ahrzb/.nix-profile/bin/python";
      "files.watcherExclude" = { "**/venv/**" = true; };
      "vim.highlightedyank.enable" = true;
    };
    extensions = with pkgs.vscode-extensions;
      [
        ms-python.python
        ms-vscode-remote.remote-ssh
        ms-kubernetes-tools.vscode-kubernetes-tools
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vim";
          publisher = "vscodevim";
          version = "1.18.5";
          sha256 = "0cbmmhkbr4f1afk443sgdihp2q5zkzchbr2yhp7bm5qnv7xdv5l4";
        }
        {
          name = "gc-excelviewer";
          publisher = "GrapeCity";
          version = "3.0.40";
          sha256 = "07f3mkrncp13arbiijchwmg95vz0z91wsp53kpfz2pdfp6wqpid3";
        }
        {
          name = "nix-env-selector";
          publisher = "arrterian";
          version = "0.1.2";
          sha256 = "1n5ilw1k29km9b0yzfd32m8gvwa2xhh6156d4dys6l8sbfpp2cv9";
        }
        {
          name = "toml";
          publisher = "be5invis";
          version = "0.5.1";
          sha256 = "1r1y6krqw5rrdhia9xbs3bx9gibd1ky4bm709231m9zvbqqwwq2j";
        }
        {
          name = "vscode-html-css";
          publisher = "ecmel";
          version = "1.1.2";
          sha256 = "099085ky7ic0xf8jbdfpjgn8fab3dgjkrr9rjbn7qqwidhqxb218";
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
  programs.matplotlib = {
    enable = true;
    config = { backend = "Qt5Cairo"; };
  };

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
    skype
    discord
    slack

    steam
    warzone2100

    kdeconnect
    kdeApplications.ksudoku
    kdeApplications.okular
    kdeApplications.ark
    kdeApplications.kate
    kdeApplications.kcalc
    kdeApplications.spectacle
    kdeApplications.gwenview
    plasma5.plasma-browser-integration

    godot

    (python38.withPackages (ps:
      with ps; [
        virtualenv
        pydub
        ipython
        jupyter
        ipywidgets
        numpy
        pandas
        spacy
        thinc
        scikitlearn
        pytorch
        pillow
        joblib
        tqdm
        pydub
        matplotlib
        pycairo
        seaborn
        boto
        beautifulsoup4
        requests
        PyHTML
        w3lib
      ]))
    poetry
    pyprof2calltree
    kcachegrind
    black

    nodejs

    clojure
    leiningen
    babashka
    lumo

    julia

    go_1_15

    nixfmt
    nix-prefetch-git

    valgrind

    kubectl
    docker-compose
    vagrant

    gron
    pup
    rq
    aha

    httpie
    youtube-dl
    s3cmd

    wineFull
    ranger
    sshfs
    rsync
    rclone
    mosh
    byobu
    hyperfine
    parallel
    pv
    ripgrep
    fd
    entr
    ffmpeg
    ansible
    tree

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

  home.file.".s3cfg".source = pkgs.writeText "s3cfg" ''
    [default]
    host_base = ${secrets.s3cmd.host_base}
    host_bucket = ${secrets.s3cmd.host_bucket}
    access_key = ${secrets.s3cmd.access_key}
    secret_key = ${secrets.s3cmd.secret_key}
  '';

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
