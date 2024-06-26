{ pkgs, ... }:

{
  imports = [
    ./sound.nix
    ./bluetooth.nix
    ./keyboard.nix
    ./sddm.nix # Login
#    ./sushi.nix # Image Viewer for Nautilus
  ];

  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
  };
  
}
