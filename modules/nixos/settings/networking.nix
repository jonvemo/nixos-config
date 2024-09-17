{ config, pkgs, ... }:

{
  networking = {
    hostName = "jonvemo";
    networkmanager.enable = true;
  };
}
