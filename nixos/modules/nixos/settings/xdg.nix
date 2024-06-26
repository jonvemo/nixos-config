{config, pkgs, ...}:

{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
#      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
#      xdg-desktop-portal-gnome
    ];

    config.common.default = [
      "gtk"
    ];

    xdgOpenUsePortal = true;
  };
}
