{ config, dotfiles, ... }: let
  symlink = config.lib.file.mkOutOfStoreSymlink;
  path = dotfiles.programs;
in {
  xdg.configFile = {
    "niri/config.kdl".source = symlink "${path}/niri/niri.kdl";
  };
}
