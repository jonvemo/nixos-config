let
  config = ''
    monitor=,preferred,auto,auto
    # See https://wiki.hyprland.org/Configuring/Keywords/ for more

    # Execute your favorite apps at launch
    exec-once = hyprctl setcursor Anya 32 & hyprpaper & hypridle & waybar

    # VARS
    source = ~/.config/hypr/hyprvars.conf

    # GENERAL
    source = ~/.config/hypr/modules/general.conf
    source = ~/.config/hypr/modules/animations.conf
    source = ~/.config/hypr/modules/cursors.conf

    ## INPUTS
    source = ~/.config/hypr/modules/inputs.conf

    ## KEYBINDS
    source = ~/.config/hypr/modules/workspaces.conf
    source = ~/.config/hypr/modules/windows.conf
    source = ~/.config/hypr/modules/programs.conf
    source = ~/.config/hypr/modules/controls.conf

    ## RULES
    source = ~/.config/hypr/modules/rules.conf

    # ENV VARS
    # env = HYPRCURSOR_THEME,MyCursor
    # env = HYPRCURSOR_SIZE,24
  '';
in
{
  xdg.configFile."hypr/hyprland.conf".text = config;
}
