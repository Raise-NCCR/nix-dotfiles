{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true; # cdなしでファイルパスだけで移動
    enableCompletion = true; # 自動補完
    autosuggestion.enable = true; # 入力サジェスト
    syntaxHighlighting.enable = true; # シンタックスハイライト
    shellAliases = {
      myHome-flake = "home-manager switch --flake .#myHome";
      dWork = "/home/raise/workspace"
    };
  };
}
