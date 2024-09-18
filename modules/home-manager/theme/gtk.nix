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
      name = "Anya";
      size = 24;
    };
    
    gtk3 = {
      bookmarks = [
        # "file:///home/jonvemo/Downloads"
        # "file:///home/jonvemo/Documents"
        # "file:///home/jonvemo/Pictures"
        # "file:///home/jonvemo/Videos"
        # "file:///home/jonvemo/Music"
        "file:///home/jonvemo/Cozy%20Drive"
        "file:///home/jonvemo/Cozy%20Drive/Krita"

      ];
      # extraConfig.gtk-application-prefer-dark-theme = 1;
    };
    # gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    
  };
  
}
