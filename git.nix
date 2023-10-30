{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "Raise-NCCR";
    userEmail = "raise1229@gmail.com";
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
    extensions = with pkgs; [gh-markdown-preview]; # オススメ
    settings = {
      editor = "nvim";
    };
  };
}
