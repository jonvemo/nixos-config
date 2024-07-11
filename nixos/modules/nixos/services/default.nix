{ pkgs, ... }:

{
  imports = [
    ./sound.nix
    ./bluetooth.nix
    ./keyboard.nix
    ./sddm.nix # Login
    ./trash.nix
  ];

  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
  };
  
}
