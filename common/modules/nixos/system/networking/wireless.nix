{
  networking.wireless.iwd = {
    enable = true;
    
    settings = {
      Scan.DisablePeriodicScan = false;
      Settings.AutoConnect = true;
      IPv6.Enabled = true;

      General = {
        # AddressRandomization = "network";
        # AddressRandomizationRange = "full";
        EnableNetworkConfiguration = true;
        RoamRetryInterval = 15;
      };

      Network = {
        EnableIPv6 = true;
        RoutePriorityOffset = 300;
      };
      
    };
        
  };

}
