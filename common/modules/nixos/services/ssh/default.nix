{
  services.openssh = {
    enable = true;
    settings = {
      UseDns = true;
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

}
