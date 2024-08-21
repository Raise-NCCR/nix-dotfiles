{
 imports = [
    ./zsh.nix
    ./neovim.nix
    ./direnv.nix
    ./development.nix
    #./python.nix
    ./browser.nix
    ./apps.nix
    ./command.nix
  ];
  home = rec {
    username = "raise";
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;
  programs.termite.audibleBell = false;
}
