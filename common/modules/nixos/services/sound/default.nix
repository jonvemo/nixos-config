{ lib, ... }:
{
  services = {
    pipewire = {
      enable = true;
      wireplumber.enable = true;

      /* Compatibility - All can run only with this, restart required. Wayland */
      pulse.enable = true;

      /* Specific Use */
      jack.enable = false;

      /* Enable Main Device Sound and a lot of Packages */
      alsa = {
        enable = false;
        support32Bit = lib.mkDefault false;
      };
    };
  };
  
}
