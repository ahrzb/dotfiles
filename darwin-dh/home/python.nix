{ config, pkgs, lib, ... }: {
  home.packages = lib.singleton
    (pkgs.python39.withPackages (ps: with ps; [ ipython pyaml GitPython ]));
}
