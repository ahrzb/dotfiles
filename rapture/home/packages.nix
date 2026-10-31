{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Desktop
    chromium
    discord
    obsidian
    slack
    spotify
    telegram-desktop
    vivaldi
    vlc

    # System
    ffmpeg
    nvtopPackages.full
    ventoy

    # Editors and terminals
    android-studio
    claude-code
    code-cursor
    cursor-cli
    emacs
    ghostty
    vscode

    # Development
    asdf-vm
    deno
    devbox
    docker-compose
    go
    mise
    nodejs_latest
    pnpm
    rustup
    uv
    yarn

    # Audio
    guitarix
    qpwgraph
    reaper
    reaper-reapack-extension

    # Games
    augustus
  ];
}
