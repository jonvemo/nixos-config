{inputs,pkgs,...}:
{  
  environment.systemPackages = with pkgs; [
    inputs.pumpkin.packages.${system}.default
  ];
  
  specialisation.pumpkin-server.configuration = {
    networking.firewall = {
      allowedTCPPorts = [ 42565 ];
      allowedUDPPorts = [ 49132 ];
    };
  };
}
