{ config, lib, pkgs, ... }:
let
  cfg = config.deliveryhero;
  inherit (lib) mkEnableOption mkDefaultOption mkIf;
in {
  options = {
    deliveryhero.kubernetes = {
      consolidatedKubeConf = {
        enable = lib.mkEnableOption "Write consolidated kube config to ~/.kube/config";
        logisticsKubernetesRef = lib.mkOption {
          default = "master";
        };
        logisticsKubernetesRev = lib.mkOption {
          default = "17f024403b8776f71902d3dc1a0da6ae40d04958";
        };
      };
    };
  };
  config = 
    mkMerge [
      (
        lib.mkIf (config.deliveryhero.consolidatedKubeConf) {
          xdg.configFile = {
            "git/config".text =
              let repo = builtins.fetchGit {
                url = "git@github.com:deliveryhero/logistics-kubernetes.git";
                ref = cfg.consolidatedKubeConf.logisticsKubernetesRef;
                rev = cfg.consolidatedKubeConf.logisticsKubernetesRev;
              };
              in builtins.readFile "${repo}/kubeconfig/consolidated";
          };
        }
      )
  ];
}