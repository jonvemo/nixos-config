{ pkgs, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        amdvlk
        mesa.drivers
      ];    
    };

    # amdgpu.amdvlk.enable = true; 
  };
  
}
