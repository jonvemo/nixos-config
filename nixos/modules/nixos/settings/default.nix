{ config, pkgs, ... }:

{
  imports = [
    ./xdg.nix
    ./networking.nix
    ./time.nix
    ./locale.nix
    ./keyboard.nix
    ./font.nix
    ./stylix.nix
  ];
}
