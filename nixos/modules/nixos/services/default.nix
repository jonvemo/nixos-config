{ pkgs, ... }:

{
  imports = [
    ./sound.nix
    ./bluetooth.nix
    ./login.nix
    ./trash.nix
  ];
  
}
