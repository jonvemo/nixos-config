{ config, pkgs, inputs, ... }:

{
  imports = [
    ./packages
    ./programs
    ./services
    ./theme
    ./vars
  ];
}
