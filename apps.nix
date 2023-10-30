{pkgs, ...}: {
  # Spotify TUI
  programs.ncspot = {
    enable = true;
  };
  # OBS
  programs.obs-studio = {
    enable = true;
  };
  home.packages = with pkgs; [
    discord
    discord-ptb
    parsec-bin # 超速いリモートデスクトップクライアント
    remmina # VNCクライアント
    slack
    spotify
    teams-for-linux # タイル型WMを使っている人は必須
    vscode
  ];
}
