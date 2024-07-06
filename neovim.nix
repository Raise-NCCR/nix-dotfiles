{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [      # Treesitter
      (nvim-treesitter.withPlugins (plugins:
        with plugins; [
          tree-sitter-markdown
          tree-sitter-nix
          # ...
        ]))
      telescope-nvim
      vim-nix {
        plugin = kanagawa-nvim;
        config = ''
          colorscheme kanagawa
          '';
      }
      vim-plug
      coc-rust-analyzer
    ];
    extraPackages = with pkgs; [
      ripgrep
      # ...
    ];
    extraLuaConfig = builtins.readFile ./init.vim; # 単一の文字列で与える
  };
}
