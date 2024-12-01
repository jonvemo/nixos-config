{ pkgs, ...}:

{
  home.packages = with pkgs; [
    # Learning
    remnote

    # Programming
    zed-editor           # NOTE Editors
    lazygit woff2 ffmpeg_7 # NOTE Tools

    # Desing
    figma-linux
  ];
}
