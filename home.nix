{
 imports = [
    ./zsh.nix
    ./neovim.nix
    ./direnv.nix
    ./development.nix
    ./browser.nix
    ./apps.nix
  ];
  home = rec {
    username = "raise";
    homeDirectory = "/home/${username}";
    stateVersion = "22.11";
  };
  programs.home-manager.enable = true;
}
