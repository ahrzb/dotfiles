{
  programs = {
    ssh = {
      matchBlocks."*" = {
        host = "*";
        extraOptions.IdentityAgent = "~/.1password/agent.sock";
      };
    };
  };
}
