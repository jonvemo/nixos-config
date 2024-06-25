{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    xkb = {
      layout = "latam";
      variant = "deadtilde";
    };
    
  };
}
