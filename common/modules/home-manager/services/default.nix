{ config,... }:
{
  imports = [
    ./mpris-proxy
    ./mako
    ./hypridle
    ./swww
  ];

  services.mpd = {
    enable = true;
    network.startWhenNeeded = true;  
    musicDirectory = "${config.home.homeDirectory}/Music";
  };

}
