{ config, dotfiles, ... }: let
  symlink = config.lib.file.mkOutOfStoreSymlink;
in {
  xdg.configFile = {
    "hypr/hyprland.conf".source = symlink "${dotfiles.programs}/hyprland/hyprland.conf";
    "hypr/hyprvars.conf".source = symlink "${dotfiles.programs}/hyprland/hyprvars.conf";
    "hypr/modules/animations.conf".source = symlink "${dotfiles.programs}/hyprland/modules/animations.conf";
    "hypr/modules/controls.conf".source = symlink "${dotfiles.programs}/hyprland/modules/controls.conf";
    "hypr/modules/cursors.conf".source = symlink "${dotfiles.programs}/hyprland/modules/cursors.conf";
    "hypr/modules/general.conf".source = symlink "${dotfiles.programs}hyprland/modules/general.conf";
    "hypr/modules/inputs.conf".source = symlink "${dotfiles.programs}/hyprland/modules/inputs.conf";
    "hypr/modules/programs.conf".source = symlink "${dotfiles.programs}/hyprland/modules/programs.conf";
    "hypr/modules/rules.conf".source = symlink "${dotfiles.programs}/hyprland/modules/rules.conf";
    "hypr/modules/windows.conf".source = symlink "${dotfiles.programs}/hyprland/modules/windows.conf";
    "hypr/modules/workspaces.conf".source = symlink "${dotfiles.programs}/hyprland/modules/workspaces.conf";
  };
}
