{ pkgs, ... }:
{
  # NOTE Root Packages
  environment.systemPackages = with pkgs; [
    home-manager
    kitty # NOTE Req. Hyprland
  ];
}
