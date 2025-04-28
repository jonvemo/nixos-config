{ pkgs, ... }:
{
  imports = [
    ./fish
    ./nh
    ./niri
    ./xwayland
    ./nautilus
    ./curd
    ./steam
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
