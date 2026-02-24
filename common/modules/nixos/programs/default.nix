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
    ./fsel
    ./crush
    ./screenrec
    ./bottom
  ];

  programs = {
    command-not-found.enable = false;
    nix-ld.enable = true;
  };

  environment.defaultPackages = with pkgs; [
    # Per Default Install
    # perl rsync strace
  ];

}
