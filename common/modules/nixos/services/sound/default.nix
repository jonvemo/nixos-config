{
  services.pipewire = {
    enable = true;

    /* Compatibility - All can run only with this, restart required. Wayland */
    pulse.enable = true;

    /* Legacy - osu!lazer */
    alsa.enable = true;
  };
  
}
