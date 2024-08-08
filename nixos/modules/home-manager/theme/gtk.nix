{ pkgs, ... }:
{
  gtk = {
    enable = true;

    # theme = {
    #   name = "adw-gtk3";
    #   package = pkgs.fluent-gtk-theme; # Fluent
    # };
    
    iconTheme = {
      name = "Stylish-Adwaita";
    };
    
    cursorTheme = {
      # package = pkgs.qogir-icon-theme;
      # name = "Qogir Cursors";
      name = "Lifrim";
      # size = 24;
    };
    
    # gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    # gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    
  };
  
}
