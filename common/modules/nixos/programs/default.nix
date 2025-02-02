{ pkgs, ... }:
{
  imports = [
    ./fish
    ./nh
    ./hyprland
    ./niri
    ./xwayland
    ./nautilus
    ./steam
    ./zen
    ./curd
    ./umu
    ./anime-games
  ];

  programs.command-not-found.enable = false;

  environment.defaultPackages = with pkgs; [
    # Per Default Install
    # perl rsync strace
  ];

}
