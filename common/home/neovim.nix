{ pkgs, ... }: {
  programs = {
    neovim = {
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraLuaConfig = ''
        vim.cmd [[colorscheme dracula]]
      '';

      coc = {
        enable = true;
        settings = {
          languageserver = {
            nix = {
              command = "${pkgs.nil}/bin/nil";
              filetypes = [ "nix" ];
              rootPatterns = [ "flake.nix" ];
            };
            terraform = {
              command = "${pkgs.terraform-ls}/bin/terraform-ls";
              args = [ "serve" ];
              filetypes = [
                "terraform"
                "tf"
              ];
              initializationOptions = { };
              settings = { };
            };
          };
          suggest = {
            autoTrigger = true;
          };
        };
      };

      plugins = with pkgs.vimPlugins; [
        dracula-nvim
        which-key-nvim
        nvim-fzf
        vim-gitgutter
        vim-fugitive
        nvim-treesitter.withAllGrammars
        vim-terraform
      ];
    };
  };
}
