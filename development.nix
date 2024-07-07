{
    inputs = {
        erg.url = "ttps://github.com/erg-lang/erg.git";
    };
    outputs = {pkgs, erg, ...}: {
        home.packages = [
            erg
            pkgs.yarn
            pkgs.git
            pkgs.gcc
            pkgs.go
            pkgs.deno
            pkgs.nodejs
            pkgs.rust-bin.stable.latest.default
        ];
    };

}
