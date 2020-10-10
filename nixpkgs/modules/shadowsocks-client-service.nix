{ config, lib, pkgs, ... }:

let
  inherit (lib)
    types literalExample mkEnableOption mkOption mkIf optionalString;
  cfg = config.services.shadowsocks-client;
  shadowsocks_config = pkgs.writeTextFile {
    name = "shadowsocks.json";
    text = builtins.toJSON {
      server = cfg.server;
      server_port = cfg.server_port;
      local_address = cfg.local_address;
      local_port = cfg.local_port;
      password = cfg.password;
      method = cfg.method;
      plugin = cfg.plugin;
    };
  };
in {
  options = {
    services.shadowsocks-client = {
      enable = mkEnableOption "shadowsocks-client";

      package = mkOption {
        default = pkgs.shadowsocks-libev;
        type = types.package;
        example = literalExample "pkgs.shadowsocks-client";
        description = "The package to use for the shadowsocks-client binary.";
      };

      server = mkOption { };

      server_port = mkOption { };

      local_address = mkOption { default = "127.0.0.1"; };

      local_port = mkOption { default = "1080"; };

      password = mkOption { };

      timeout = mkOption { default = 30; };

      method = mkOption { };

      plugin = mkOption { };
    };

  };

  config = mkIf cfg.enable {
    systemd.user.services.shadowsocks-client = {
      Unit = {
        Description = "connect to shadowsocks";
        After = [ "network.target" ];
      };
      Service = {
        ExecStart = ''
          ${cfg.package}/bin/ss-local -c "${shadowsocks_config}"
        '';
        Type = "simple";
        Restart = "always";
      };
      Install = { WantedBy = [ "multi-user.target" ]; };
    };
  };
}
