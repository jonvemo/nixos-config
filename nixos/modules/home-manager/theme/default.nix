{
  imports = [
    ./font.nix
    ./gtk.nix
  ];
  
  stylix.targets = {
    
    waybar = {
      enable = true;
#      enableCenterBackColors = true;
      enableLeftBackColors = true;
#      enableRightBackColors = true;
    };

    hyprland.enable = true;
    hyprpaper.enable = true;
    helix.enable = true;
    rofi.enable = true;
    
    
  };
}
