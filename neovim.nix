{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # Treesitter
      (nvim-treesitter.withPlugins (plugins:
        with plugins; [
          tree-sitter-markdown
          tree-sitter-nix
          # ...
        ]))
      telescope-nvim
      # ...
    ];
    extraPackages = with pkgs; [
      ripgrep
      # ...
    ];
    extraLuaConfig = builtins.readFile ./init.lua; # 単一の文字列で与える
  };
}
