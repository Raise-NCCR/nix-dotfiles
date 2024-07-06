{pkgs, ...}: {
  home.packages = with pkgs; [
    yarn
    git
    gcc
    go
    deno
    nodejs
    rust-bin.stable.latest.default
  ];
}
