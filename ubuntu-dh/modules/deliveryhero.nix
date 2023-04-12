{ pkgs, config, lib, ... }:
let
  cfg = config.deliveryhero;
  logisticsTerraform = builtins.fetchGit {
    url = "git@github.com:deliveryhero/logistics-terraform.git";
    ref = cfg.logisticsSaml2awsConfig.logisticsTerraformRef;
    rev = cfg.logisticsSaml2awsConfig.logisticsTerraformRev;
  };
  logisticsKubernetes = builtins.fetchGit {
    url = "git@github.com:deliveryhero/logistics-kubernetes.git";
    ref = cfg.logisticsConsolidatedConfig.logisticsKubernetesRef;
    rev = cfg.logisticsConsolidatedConfig.logisticsKubernetesRev;
  };
  inherit (lib) types mkEnableOption mkOption mkMerge mkIf;
in {
  options = {
    deliveryhero = mkOption {
      type = types.submodule {
        options = {
          disableKubeConfigEnv = mkEnableOption "Set KUBECONFIG to /dev/null";
          logisticsConsolidatedConfig = {
            enable =
              mkEnableOption "Write consolidated kube config to ~/.kube/config";
            logisticsKubernetesRef = mkOption {
              type = types.str;
              default = "master";
            };
            logisticsKubernetesRev = mkOption {
              type = types.str;
              description = "logistics-kubernetes repo revision to use";
            };
          };
          logisticsSaml2awsConfig = {
            enable = mkEnableOption
              "Use saml2aws config from logistics-terraform repository";
            logisticsTerraformRef = mkOption {
              type = types.str;
              default = "master";
            };
            logisticsTerraformRev = mkOption {
              type = types.str;
              description = "logistics-terraform repo revision to use";
            };
          };
        };
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.disableKubeConfigEnv {
      home.sessionVariables."KUBECONFIG" = "/dev/null";
    })

    (mkIf cfg.logisticsConsolidatedConfig.enable {
      home.file.".kube/config".text =
        builtins.readFile "${logisticsKubernetes}/kubeconfig/consolidated";
    })

    (mkIf cfg.logisticsSaml2awsConfig.enable {
      home.sessionVariables."SAML2AWS_CONFIGFILE" =
        "${logisticsTerraform}/files/saml2aws";
    })
  ];
}
