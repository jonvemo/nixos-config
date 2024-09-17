{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      amdvlk
      mesa.drivers
    ];
    
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
    
  };
  
}
