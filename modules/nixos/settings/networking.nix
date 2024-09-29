{ config, pkgs, ... }:

{
  networking = {
    hostName = "jonvemo";

    # NOTE Necesario cambiar backend a iwd antes del cambio completo con wireless.iwd, for some reason? 
    # Caso contrario, 1-2s más lento que con networkmanager. Al hacer el cambio ahora va más rápido.
    
    # networkmanager = {
    #   enable = false;
    #   wifi.backend = "iwd";
    # };

    wireless.iwd = {
      enable = true;
      
      settings = {
        General = {
          EnableNetworkConfiguration = true;
        };
      
        Settings = {
          AutoConnect = true;
        };
        
      };
      
    };
    
  };
}
