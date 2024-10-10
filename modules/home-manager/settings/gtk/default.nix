{ pkgs, ... }:
{
  gtk = {
    enable = true;
    
    iconTheme = {
      name = "Stylish-Adwaita";
    };
    
    cursorTheme = {
      name = "Anya";
      size = 24;
    };
    
    gtk3 = {
      bookmarks = [
        "file:///home/jonvemo/Cozy%20Drive"
        "file:///home/jonvemo/Cozy%20Drive/Krita"
        "file:///home/jonvemo/Desktop/GitHub"
      ];
    };
    
  };
  
}
