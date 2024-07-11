{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
      config.common.default = [ "hyprland" ];
    };

    mime = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        
        "image/*" = [ "org.gnome.Loupe.desktop" ];
        "image/png" = [ "org.gnome.Loupe.desktop" ];
        "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
        "image/gif" = [ "org.gnome.Loupe.desktop" ];
        
        "video/*" = [ "io.github.celluloid_player.Celluloid.desktop" ];

        "audio/*" = [ "com.github.neithern.g4music.desktop" ];
        "audio/mp3" = [ "com.github.neithern.g4music.desktop"];

        "application/zip" = [ "org.gnome.FileRoller.desktop" ];
        "application/rar" = [ "org.gnome.FileRoller.desktop" ];
        "application/7z" = [ "org.gnome.FileRoller.desktop" ];
        "application/*tar" = [ "org.gnome.FileRoller.desktop" ];
     };
      
    };
    
  };
   
}

