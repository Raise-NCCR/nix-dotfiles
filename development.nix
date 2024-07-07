{pkgs, ...}: {
    home.packages = with pkgs; [
        erg
        yarn
        git
        gcc
        go
        deno
        nodejs
        rust-bin.stable.latest.default
    ];
};

