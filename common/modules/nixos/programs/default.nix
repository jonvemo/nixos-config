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
