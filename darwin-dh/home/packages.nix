{ pkgs, ... }: {
  home.packages = with pkgs; [
    argo # Container native workflow engine for Kubernetes
    aws-iam-authenticator # AWS IAM credentials for Kubernetes authentication
    saml2aws # CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP
    google-cloud-sdk # Tools for the google cloud platform
    awscli # Unified tool to manage your AWS services

    terraform # Tool for building, changing, and versioning infrastructure
    kubectl # Kubernetes CLI
    kubernetes-helm # A package manager for kubernetes
    helmfile # Deploy Kubernetes Helm charts
    kubetail # Bash script to tail Kubernetes logs from multiple pods at the same time
    k9s # Kubernetes CLI To Manage Your Clusters In Style

    git # Distributed version control system
    tig # Text-mode interface for git
    pre-commit # A framework for managing and maintaining multi-language pre-commit hooks
    poetry # Python dependency management and packaging made easy

    vagrant # A tool for building complete development environments

    # Classics
    coreutils # The basic file, shell and text manipulation utilities of the GNU operating system
    curl # A command line tool for transferring files with URL syntax
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    xz # A general-purpose data compression software, successor of LZMA
    tree # Command to produce a depth indented directory listing
    aria2 # A lightweight, multi-protocol, multi-source, command-line download utility

    # Modern unix
    bat # A cat(1) clone with syntax highlighting and Git integration
    broot # An interactive tree view, a fuzzy search, a balanced BFS descent and customizable commands
    dasel # Query and update data structures from the command line
    dogdns # Command-line DNS client
    fd # A simple, fast and user-friendly alternative to find
    fzf # A command-line fuzzy finder written in Go
    gron # Make JSON greppable!
    httpie # A command line HTTP client whose goal is to make CLI human-friendly
    hyperfine # Command-line benchmarking tool
    jq # A lightweight and flexible command-line JSON processor
    mosh # Secure ssh-agent forwarding for Mosh and SSH
    ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
    sd # Intuitive find & replace CLI (sed alternative)

    # Devtools, other
    asdf-vm # Manage multiple runtime versions with a single CLI tool
    go_1_17 # The Go Programming language
    rustup # The Rust toolchain installer

    # Nix utilities
    cachix # Command line client for Nix binary cache hosting https://cachix.org
    nix-diff # Explain why two Nix derivations differ
    nixfmt # An opinionated formatter for Nix
    statix # Lints and suggestions for the nix programming language

    # Automation helpers
    _1password # 1Password command-line tool
    gh # GitHub CLI tool
    m-cli # Swiss Army Knife for macOS
    mas # Mac App Store command line interface
  ];
}
