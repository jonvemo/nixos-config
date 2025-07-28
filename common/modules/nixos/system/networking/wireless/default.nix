{
  networking.wireless.iwd = {
    enable = true;    
    settings = {
      Scan.DisablePeriodicScan = false;
      Settings.AutoConnect = true;
      General = {
        # AddressRandomization = "network";
        # AddressRandomizationRange = "full";
        EnableNetworkConfiguration = true;
        RoamRetryInterval = 15;
      };
      Network = {
        RoutePriorityOffset = 300;
      };
      
    };
  };
}
