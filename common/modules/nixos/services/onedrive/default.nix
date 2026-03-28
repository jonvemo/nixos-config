{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.onedrive ];

  systemd.user.services.onedrive-sync = {
    description = "Scheduled OneDrive synchronization";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.onedrive}/bin/onedrive --sync";
      CPUWeight = 15;
      IOWeight = 20;
      IOSchedulingClass = "idle";
    };
    wantedBy = [ "default.target" ];
  };

  systemd.user.timers.onedrive-sync = {
    description = "Timer for OneDrive synchronization every 10 minutes";
    timerConfig = {
      OnBootSec = "2m";
      OnUnitActiveSec = "10m";
      Persistent = true;
    };
    wantedBy = [ "default.target" ];
  };
}
