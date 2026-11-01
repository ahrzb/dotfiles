{ pkgs, ... }:
{
  home.packages = with pkgs; [
    asdf-vm
    beancount
    docker-compose
    go
    m-cli
    nodejs-slim_22
    pnpm
    rustup
    uv
  ];
}
