{ config, pkgs, ... }:
{
  services.mpd = {
    enable = true;
    network.startWhenNeeded = true;
    musicDirectory = "${config.home.homeDirectory}/Music";

    extraConfig = ''
       max_connections "1"
    '';
  };
}
