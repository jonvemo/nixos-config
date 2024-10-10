{
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    
    # NOTE Más información: https://nixos.wiki/wiki/Storage_optimization
    optimise = {
      automatic = true;
      dates = [ "2:00" ];
    };
    
  };

}
