{ config, pkgs, ...}:

{
  imports = [
#    ./bash.nix
    ./kitty
#    ./helix
#    ./starship
    ./ags.nix
#    ./rofi.nix
    ./waybar.nix
    ./niri.nix
  ];
}
