{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    extraConfig = ''
      source ${pkgs.vimPlugins.vim-plug}/plug.vim
      source ${./init.vim}
    '';
  };
}
