{pkgs, ...}: {
    home.packages = with pkgs; [
        erg
        yarn
        git
        gcc
        go
        deno
        nodejs
	pipenv
        rust-bin.stable.latest.default
    ];
}

