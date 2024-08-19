{pkgs, ...}: {
  home.packages = with pkgs; [
    (python310.withPackages(ps: with ps; [
      pandas
      numpy
      scipy
      matplotlib
    ]))
  ];
}
