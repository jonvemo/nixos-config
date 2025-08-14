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

    gtk3 = {
      bookmarks = [
        "file:///${config.home.homeDirectory}/OneDrive"
        "file:///${config.home.homeDirectory}/OneDrive/Krita"
        "file:///${config.home.homeDirectory}/Desktop/GitHub"
      ];
    };
    
  };
  
}
