{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Games
    lunar-client prismlauncher 
    osu-lazer-bin r2modman /* Mods for Lethal Company and others */ 
    lutris
  ];
}
