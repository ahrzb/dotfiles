{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord # All-in-one cross-platform voice and text chat for gamers
    telegram-desktop # Telegram Desktop messaging app
    chromium # An open source web browser from Google
    nvtopPackages.full # A (h)top like task monitor for AMD, Adreno, Intel and NVIDIA GPUs
    spotify # Play music from the Spotify music service
    obsidian # A powerful knowledge base that works on top of a local folder of plain text Markdown files

    coreutils # The basic file, shell and text manipulation utilities of the GNU operating system
    curl # A command line tool for transferring files with URL syntax
    wget # Pure python download utility
    xz # A general-purpose data compression software, successor of LZMA
    tree # Command to produce a depth indented directory listing
    aria2 # A lightweight, multi-protocol, multi-source, command-line download utility
    fd # A simple, fast and user-friendly alternative to find
    fzf # A command-line fuzzy finder written in Go
    mosh # Mobile shell (ssh replacement)
    ghostty # Ghostty is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration

    vscode # Open source source code editor developed by Microsoft for Windows, Linux and macOS
    emacs # Extensible, customizable GNU text editor

    docker-compose # Docker CLI plugin to define and run multi-container applications with Docker

    httpie # A command line HTTP client whose goal is to make CLI human-friendly (py310-openssl broken)
    jq # jq for binary formats
    comby # Tool for searching and changing code structure
    ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep

    go_1_23 # The Go Programming language
    rustup # The Rust toolchain installer
    yarn # Fast, reliable, and secure dependency management for javascript
    nodejs-18_x # Event-driven I/O framework for the V8 JavaScript engine
    nodePackages.pnpm # Fast, disk space efficient package manager for node
    deno # Secure runtime for JavaScript and TypeScript
    uv # Extremely fast Python package installer and resolver, written in Rust
    asdf-vm # Manage multiple runtime versions with a single CLI tool
    devbox # Instant, easy, predictable shells and containers

    statix # Lints and suggestions for the nix programming language
    nix-diff # Explain why two Nix derivations differ
  ];
}
