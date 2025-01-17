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
        "file:///home/jonvemo/OneDrive"
        "file:///home/jonvemo/OneDrive/Krita"
        "file:///home/jonvemo/Desktop/GitHub"
      ];
    };
    
  };
  
}
