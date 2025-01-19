{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.curd.packages."x86_64-linux".curd
  ];
}
