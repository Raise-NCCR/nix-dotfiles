{pkgs, ...}: {
  home.packages = with pkgs; [
    unzip
    nmap
  ];
}
