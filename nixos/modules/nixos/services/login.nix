{ pkgs, ... }:
{
  # NOTE No parece ver una versión puramente wayland que no requiera configuraciones adicionales
  # X consume 127MB 
  # services.xserver = {
  #   enable = true;
  #   excludePackages = [ pkgs.xterm ];
  # };
  # services.displayManager.sddm.wayland.enable = true;

  services.greetd.enable = true;
  programs.regreet = {
    enable = true;
    
  };
  
}
