{ pkgs, ... }:
{
  # NOTE Jonvemo Packages
  users.users.jonvemo.packages = with pkgs; [
    # Está siendo gestionado por HomeManager
  ];

  # NOTE Root Packages
  environment.systemPackages = with pkgs; [
    # Starter Pack
    home-manager ags
    # NOTE Hyprland requiere Kitty
    kitty 
    # TEST Niri Wayland Compositor
    niri alacritty
  ];
}
