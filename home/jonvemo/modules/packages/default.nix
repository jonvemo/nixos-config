{ pkgs, ...}:

{
  home.packages = with pkgs; [
    # Tools
    btop tagger /* Music Tagger */ parabolic /* Download Music */

  ];
}
