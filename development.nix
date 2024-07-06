{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    gcc
    go
    deno
    nodejs
    rust-bin.stable.latest.default
  ];
}
