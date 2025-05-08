{ pkgs, lib, ... }: {
  home.packages = lib.singleton (pkgs.python310.withPackages
    (ps: with ps; [ pyaml pipx ]));
}
