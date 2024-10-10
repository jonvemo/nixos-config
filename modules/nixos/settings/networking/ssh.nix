{
  services.openssh = {
    enable = true;
    settings = {
      UseDns = true;
      PasswordAuthentication = false; # Desactiva la autenticación por contraseña
      PermitRootLogin = "prohibit-password"; # Deshabilita el acceso root por contraseña
    
    };
  
  };

}
