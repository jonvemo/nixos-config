{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # NOTE Usar GTK/Hyprland # Hyprland mejora el contexto de ventanas # GTK Enlaces
      config.common.default = [ "gtk" ];
    };
    
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        "inode/blockdevice" = [ "org.gnome.Nautilus.desktop" ];
        
        "image/png" = [ "org.gnome.Loupe.desktop" ];
        "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
        "image/gif" = [ "org.gnome.Loupe.desktop" ];
        "image/webp" = [ "org.gnome.Loupe.desktop" ];
        "image/avif" = [ "org.gnome.Loupe.desktop" ];
        
        "video/mp4" = [ "io.github.celluloid_player.Celluloid.desktop" ];
        "video/webm" = [ "io.github.celluloid_player.Celluloid.desktop" ];
        "video/mkv" = [ "io.github.celluloid_player.Celluloid.desktop" ];

        "audio/mp3" = [ "com.github.neithern.g4music.desktop"];
        "audio/m4a" = [ "com.github.neithern.g4music.desktop"];
        "audio/flac" = [ "com.github.neithern.g4music.desktop"];

        "application/zip" = [ "org.gnome.FileRoller.desktop" ];
        "application/rar" = [ "org.gnome.FileRoller.desktop" ];
        "application/7z" = [ "org.gnome.FileRoller.desktop" ];
        "application/*tar" = [ "org.gnome.FileRoller.desktop" ];
     };
      
    };

    userDirs = {
      enable = true;
      createDirectories = true;

    };

    
  };
   
}
