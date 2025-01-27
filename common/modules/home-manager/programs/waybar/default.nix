{ config, dotfiles, ... }:
{
  programs.waybar.enable = true;
 
  xdg.configFile = {
    "waybar/config".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles.programs}waybar/config";
    "waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles.programs}waybar/style.css";
  };
}
