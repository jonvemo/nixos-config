{ pkgs, ... }:
{
  imports = [
    ./fish
    ./nh
    ./niri
    ./xwayland
    ./steam
    ./starship
    ./obs
    ./yazi
    ./walker
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
