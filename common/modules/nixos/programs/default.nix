{ pkgs, ... }:
{
  imports = [
    ./fish
    ./nh
    ./hyprland
    ./niri
    ./xwayland
    ./nautilus
    ./zen
    ./curd
    ./umu
    ./anime-games
    ./gaming
  ];

  programs = {
    command-not-found.enable = false;
    appimage.enable = true;
    nix-ld.enable = true;
  };

  environment.defaultPackages = with pkgs; [
    # Per Default Install
    # perl rsync strace
  ];

}
