{ config, pkgs, ... }:

{
  imports = [
    ./hardware
    ./services
    ./settings
    ./programs
    ./overlays
  ];
}
