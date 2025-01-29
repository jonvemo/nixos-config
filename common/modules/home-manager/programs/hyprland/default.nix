{ config, dotfiles, ... }: let
  symlink = config.lib.file.mkOutOfStoreSymlink;
  path = dotfiles.programs;
in {
  xdg.configFile = {
    "hypr/hyprland.conf".source = symlink "${path}/hyprland/hyprland.conf";
    "hypr/hyprvars.conf".source = symlink "${path}/hyprland/hyprvars.conf";
    "hypr/modules/animations.conf".source = symlink "${path}/hyprland/modules/animations.conf";
    "hypr/modules/controls.conf".source = symlink "${path}/hyprland/modules/controls.conf";
    "hypr/modules/cursors.conf".source = symlink "${path}/hyprland/modules/cursors.conf";
    "hypr/modules/general.conf".source = symlink "${path}hyprland/modules/general.conf";
    "hypr/modules/inputs.conf".source = symlink "${path}/hyprland/modules/inputs.conf";
    "hypr/modules/programs.conf".source = symlink "${path}/hyprland/modules/programs.conf";
    "hypr/modules/rules.conf".source = symlink "${path}/hyprland/modules/rules.conf";
    "hypr/modules/windows.conf".source = symlink "${path}/hyprland/modules/windows.conf";
    "hypr/modules/workspaces.conf".source = symlink "${path}/hyprland/modules/workspaces.conf";
  };
}
