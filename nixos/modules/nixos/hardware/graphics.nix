{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    
#    driSupport = true;
#    driSupport32Bit = true; # No longer has any effect
#    extraPackages = [ pkgs.mangohud ];
#    extraPackages32 = [ pkgs.mangohug ];
  };
}
