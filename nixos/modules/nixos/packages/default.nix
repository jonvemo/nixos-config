{ pkgs, ... }:
{
  
  # NOTE Jonvemo Packages # Cmabiar de Lugar para nuevos usuarios
  # users.users.jonvemo = {
  #   shell = pkgs.fish;
  #   packages = with pkgs; [
  #     # Está siendo gestionado por HomeManager
  #   ];
    
  #  };

  # NOTE Root Packages
  environment.systemPackages = with pkgs; [
    # Starter Pack
    home-manager
    # NOTE Hyprland requiere Kitty
    kitty
    # TEST Niri Wayland Compositor
    # niri alacritty
  ];
}
