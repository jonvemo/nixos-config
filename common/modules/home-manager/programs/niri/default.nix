{ config, dotfiles, ... }: let
  symlink = config.lib.file.mkOutOfStoreSymlink;
  path = dotfiles.programs;
in {
  xdg.configFile = {
    "niri/config.kdl".source = symlink "${path}/niri/niri.kdl";
    "niri/binds.kdl".source = symlink "${path}/niri/binds.kdl";
    "niri/rules.kdl".source = symlink "${path}/niri/rules.kdl";
    "niri/misc.kdl".source = symlink "${path}/niri/misc.kdl";
    "niri/layout.kdl".source = symlink "${path}/niri/layout.kdl";
  };
}
