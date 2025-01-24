{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.curd.packages.${system}.curd
    rofi # If GUI
  ];
}
