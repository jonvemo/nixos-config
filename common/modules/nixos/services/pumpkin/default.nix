{inputs,pkgs,...}:
{  
  environment.systemPackages = with pkgs; [
    inputs.pumpkin.packages.${system}.default
  ];
}
