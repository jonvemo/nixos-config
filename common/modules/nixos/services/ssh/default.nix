{
  services.openssh = {
    enable = false;
    settings = {
      UseDns = true;
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

}
