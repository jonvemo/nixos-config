{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
      config.common.default = [ "hyprland" ];
    };

    # mimeApps = {
    #   enable = true;
    #  defaultApplications = {
    #     "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    #    "image/*" = [ "org.gnome.Loupe.desktop" ];
    #     "video/*" = [ "io.github.Celluloid.desktop" ];

    #     "application/zip" = [ "org.gnome.FileRoller.desktop" ];
    #     "application/rar" = [ "org.gnome.FileRoller.desktop" ];
    #     "application/7z" = [ "org.gnome.FileRoller.desktop" ];
    #     "application/*tar" = [ "org.gnome.FileRoller.desktop" ];
    #  };
      
    # };
    
  };
   
}
