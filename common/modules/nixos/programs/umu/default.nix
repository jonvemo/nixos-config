{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
     umu-launcher
  ];
}
