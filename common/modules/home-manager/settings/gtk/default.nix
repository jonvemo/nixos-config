{ pkgs, config, ... }:
{
  gtk = {
    enable = true;
    
    iconTheme = {
      name = "Stylish-Adwaita";
    };
    
    cursorTheme = {
      name = "Anya";
      size = 32;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";    
  };
  
}
