{ pkgs, ... }:
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
    
    gtk3 = {
      bookmarks = [
        "file:///home/jonvemo/OneDrive"
        "file:///home/jonvemo/OneDrive/Krita"
        "file:///home/jonvemo/Desktop/GitHub"
      ];
    };
    
  };
  
}
