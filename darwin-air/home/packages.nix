{ pkgs, ... }: {
  home.packages = with pkgs; [
    coreutils # The basic file, shell and text manipulation utilities of the GNU operating system
    curl # A command line tool for transferring files with URL syntax
    wget # Pure python download utility
    xz # A general-purpose data compression software, successor of LZMA
    tree # Command to produce a depth indented directory listing
    aria2 # A lightweight, multi-protocol, multi-source, command-line download utility
    fd # A simple, fast and user-friendly alternative to find
    fzf # A command-line fuzzy finder written in Go
    mosh # Mobile shell (ssh replacement)

    docker-compose

    beancount # Double-entry bookkeeping computer language (py310-openssl broken)

    httpie # A command line HTTP client whose goal is to make CLI human-friendly (py310-openssl broken)
    jq # jq for binary formats
    comby # Tool for searching and changing code structure
    ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
    go_1_22 # The Go Programming language
    rustup # The Rust toolchain installer
    nodejs-slim_22 # Event-driven I/O framework for the V8 JavaScript engine
    nodePackages.pnpm # Fast, disk space efficient package manager for node

    statix # Lints and suggestions for the nix programming language
    nix-diff # Explain why two Nix derivations differ

    m-cli # Swiss Army Knife for macOS
  ];
}
