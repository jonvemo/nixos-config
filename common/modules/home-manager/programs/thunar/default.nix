{ config, dotfiles, ... }: let
  symlink = config.lib.file.mkOutOfStoreSymlink;
  path = dotfiles.programs;
in {  
  xdg.configFile = {
    "xfce4/xfconf/xfce-perchannel-xml/thunar.xml".source = symlink "${path}/thunar/thunar.xml";
    "Thunar/uca.xml".source = symlink "${path}/thunar/uca.xml";
  };
}
