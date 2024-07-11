{ config, pkgs, ...}:

{
  services.displayManager.sddm.wayland.enable = true;
}
