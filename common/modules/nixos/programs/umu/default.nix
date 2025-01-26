{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    umu-launcher
    wine64Packages.unstable
  ];
}
