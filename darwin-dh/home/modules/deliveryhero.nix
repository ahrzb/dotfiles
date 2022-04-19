{ config, lib, pkgs, ... }:
let
  cfg = config.deliveryhero;
  kubeConf = cfg.kubernetes;
  kubeConsolidated = kubeConf.logisticsConsolidatedConfig;
  inherit (lib) types mkEnableOption mkOption mkMerge mkIf;
in {
  options = {
    deliveryhero = {
      email = mkOption {
        type = types.str;
        example = "example@deliveryhero.com";
        description = "your @deliveryhero.com email address";
      };
      kubernetes = {
        logisticsConsolidatedConfig = {
          enable = mkEnableOption "Write consolidated kube config to ~/.kube/config";
          logisticsKubernetesRef = mkOption {
            type = types.str;
            default = "master";
          };
          logisticsKubernetesRev = mkOption {
            type = types.str;
            description = "logistics-kubernetes repo revision to use";
            default = "17f024403b8776f71902d3dc1a0da6ae40d04958";
          };
        };
        disableKubeConfigEnv = mkEnableOption "Set KUBECONFIG to /dev/null";
      };
    };
  };

  config =
    mkMerge [
      (
        mkIf (kubeConsolidated.enable) {
          home.file.".kube/config".text =
            let repo = builtins.fetchGit {
              url = "git@github.com:deliveryhero/logistics-kubernetes.git";
              ref = kubeConsolidated.logisticsKubernetesRef;
              rev = kubeConsolidated.logisticsKubernetesRev;
            };
            in builtins.readFile "${repo}/kubeconfig/consolidated";
        }
      )
      (
        mkIf (kubeConf.disableKubeConfigEnv) {
          home.sessionVariables."KUBECONFIG" = "/dev/null";
        }
      )
    ];
}