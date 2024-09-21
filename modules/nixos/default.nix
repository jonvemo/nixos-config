{
  imports = [
    ./hardware
    ./services
#    ./security
    ./settings
    ./programs
    ./packages
    ./vars
  ];

  security.rtkit.enable = true;
  
  security.doas.enable = true;
  security.sudo.enable = false;
}
