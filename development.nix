{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    deno
    nodejs # npmのないNode.js単体
    rust-bin.stable.latest.default
  ];
}
