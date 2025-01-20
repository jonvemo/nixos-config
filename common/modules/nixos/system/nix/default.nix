{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = import ./substituters;
      trusted-public-keys = import ./trusted-public-keys;
    };
    
    # NOTE Más información: https://nixos.wiki/wiki/Storage_optimization
    optimise = {
      automatic = true;
      dates = [ "2:00" ];
    };
    
  };

}
