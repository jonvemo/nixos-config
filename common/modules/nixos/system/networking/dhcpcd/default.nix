{
  networking.dhcpcd = {
    enable = true;
    wait = "background";
    extraConfig = "nohook resolv.conf";
  };
}
