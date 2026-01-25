{
  networking = {
    useDHCP = false;
    dhcpcd = {
      enable = false;
      wait = "background";
      extraConfig = "nohook resolv.conf";
    };
  };
}
