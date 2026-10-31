{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*".IdentityAgent =
      if pkgs.stdenv.hostPlatform.isDarwin then
        ''"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"''
      else
        "~/.1password/agent.sock";
  };
}
