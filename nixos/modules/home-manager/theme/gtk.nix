{ pkgs, ... }:
{
  gtk = {
    enable = true;
    
    iconTheme = {
      name = "Stylish-Adwaita";
    };
    
    cursorTheme = {
      # package = pkgs.qogir-icon-theme;
      # name = "Qogir Cursors";
      name = "Lifrim";
      # size = 64;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      # gtk-cursor-theme-name = "Qogir Cursors";
    };
    
  };
  
}
