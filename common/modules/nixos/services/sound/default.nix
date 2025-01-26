{ lib, ... }:
{
  services = {
    pipewire = {
      enable = true;
      wireplumber.enable = true;

      /* Compatibility */
      pulse.enable = true;

      /* Specific Use */
      jack.enable = false;

      /* Enable Device Sound and a lot of Packages*/
      alsa = {
        enable = false;
        support32Bit = lib.mkDefault false;
      };
    };
  };
  
}
