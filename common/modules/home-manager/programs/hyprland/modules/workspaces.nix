let
  config = ''
    # See https://wiki.hyprland.org/Configuring/Keywords/ for more
    # Switch workspaces with mainMod + [0-9]
    bind = $mod, 1, workspace, 1
    bind = $mod, 2, workspace, 2
    bind = $mod, 3, workspace, 3
    bind = $mod, 4, workspace, 4
    bind = $mod, 5, workspace, 5
    bind = $mod, 6, workspace, 6
    bind = $mod, 7, workspace, 7
    bind = $mod, 8, workspace, 8
    bind = $mod, 9, workspace, 9
    bind = $mod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mod SHIFT, 1, movetoworkspace, 1
    bind = $mod SHIFT, 2, movetoworkspace, 2
    bind = $mod SHIFT, 3, movetoworkspace, 3
    bind = $mod SHIFT, 4, movetoworkspace, 4
    bind = $mod SHIFT, 5, movetoworkspace, 5
    bind = $mod SHIFT, 6, movetoworkspace, 6
    bind = $mod SHIFT, 7, movetoworkspace, 7
    bind = $mod SHIFT, 8, movetoworkspace, 8
    bind = $mod SHIFT, 9, movetoworkspace, 9
    bind = $mod SHIFT, 0, movetoworkspace, 10

    # Example special workspace (scratchpad)
    bind = $mod, S, togglespecialworkspace, magic
    bind = $mod CTRL, S, movetoworkspace, special:magic

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mod, mouse_down, workspace, e+1
    bind = $mod, mouse_up, workspace, e-1

    bind = $mod CTRL, W, exec, [workspace 10; group] $browser & $discord
  '';
in
{
  xdg.configFile."hypr/modules/workspaces.conf".text = config;
}
