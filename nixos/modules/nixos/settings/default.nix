{ config, pkgs, ... }:

{
  imports = [
    ./xdg.nix
    ./networking.nix
    ./time.nix
    ./locale.nix
    ./font.nix
    ./stylix.nix
  ];
}
