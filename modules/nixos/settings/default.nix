{ config, pkgs, ... }:

{
  imports = [
    ./networking.nix
    ./time.nix
    ./locale.nix
    ./font.nix
    ./stylix.nix
  ];
}
