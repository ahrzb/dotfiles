{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    argo # Container native workflow engine for Kubernetes
    aws-iam-authenticator # AWS IAM credentials for Kubernetes authentication
    saml2aws # CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP

    # Tools for the google cloud platform
    (
      pkgs.google-cloud-sdk.withExtraComponents (with pkgs.google-cloud-sdk.components; [
        gke-gcloud-auth-plugin
      ])
    )

    # The home-manager package overrides the credentials file and relies on credential_process feature
    # to be used for fetching credentials which saml2aws does not support for the time being
    # https://github.com/Versent/saml2aws/issues/120

    awscli2 # Unified tool to manage your AWS services
    terraform # Tool for building, changing, and versioning infrastructure
    kubectl # Kubernetes CLI
    (wrapHelm kubernetes-helm {
      plugins = [
        kubernetes-helmPlugins.helm-secrets
        kubernetes-helmPlugins.helm-diff
      ];
    })

    kube3d # A helper to run k3s (Lightweight Kubernetes. 5 less than k8s) in a docker container - k3d
    kubernetes-helm # A package manager for kubernetes
    helmfile # Deploy Kubernetes Helm charts
    kubetail # Bash script to tail Kubernetes logs from multiple pods at the same time
    k9s # Kubernetes CLI To Manage Your Clusters In Style

    git # Distributed version control system
    pre-commit # A framework for managing and maintaining multi-language pre-commit hooks

    # Classics
    coreutils # The basic file, shell and text manipulation utilities of the GNU operating system
    curl # A command line tool for transferring files with URL syntax
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    xz # A general-purpose data compression software, successor of LZMA
    tree # Command to produce a depth indented directory listing
    aria2 # A lightweight, multi-protocol, multi-source, command-line download utility

    # Modern unix
    dasel # Query and update data structures from the command line
    dogdns # Command-line DNS client
    fd # A simple, fast and user-friendly alternative to find
    gron # Make JSON greppable!
    httpie # A command line HTTP client whose goal is to make CLI human-friendly
    hyperfine # Command-line benchmarking tool
    mosh # Secure ssh-agent forwarding for Mosh and SSH
    ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
    sd # Intuitive find & replace CLI (sed alternative)
    poetry # Python dependency management and packaging made easy
    uv # Extremely fast Python package installer and resolver, written in Rust
    jsonnet # Purely-functional configuration language that helps you define JSON data
    comby # Tool for searching and changing code structure
    glow # Render markdown on the CLI, with pizzazz!
    pandoc # Conversion between documentation formats
    gnumake # A tool to control the generation of non-source files from sources
    fzf # Command-line fuzzy finder written in Go

    # Programming
    asdf-vm # Manage multiple runtime versions with a single CLI tool
    mise # Front-end to your dev env
    devbox # Instant, easy, predictable shells and containers
    rustup # The Rust toolchain installer
    evcxr # An evaluation context for Rust
    zig # General-purpose programming language and toolchain for maintaining robust, optimal, and reusable software
    zls # Zig LSP implementation + Zig Language Server
    go # Go Programming language
    gopls # Official language server for the Go language
    nodejs_latest # Event-driven I/O framework for the V8 JavaScript engine
    nodePackages.pnpm # Fast, disk space efficient package manager
    deno # Secure runtime for JavaScript and TypeScript

    # Nix utilities
    cachix # Command line client for Nix binary cache hosting https://cachix.org
    nix-diff # Explain why two Nix derivations differ
    nixfmt-classic # An opinionated formatter for Nix
    statix # Lints and suggestions for the nix programming language

    # Automation helpers
    gh # GitHub CLI tool
    wl-clipboard # Command-line copy/paste utilities for Wayland

    docker-compose # Multi-container orchestration for Docker

    (config.lib.nixGL.wrap
      ghostty) # Fast, native, feature-rich terminal emulator pushing modern features.

    nixGLIntel
  ];
}
