{ config, pkgs, inputs, ... }:

{
  imports = [
    ./packages
    ./programs
    ./services
    ./settings
    ./theme
    ./vars
  ];
}
