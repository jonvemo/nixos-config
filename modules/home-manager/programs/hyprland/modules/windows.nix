let
  config = ''
    # See https://wiki.hyprland.org/Configuring/Keywords/ for more
    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    # bind = $mod, M, exit, 
    bind = $mod, V, togglefloating,
    bind = $mod Shift, P, pin,
    bind = $mod, P, pseudo, # dwindle
    bind = $mod, J, togglesplit, # dwindle

    # Move focus with mainMod + arrow keys 
    bind = $mod, left, movefocus, l
    bind = $mod, right, movefocus, r
    bind = $mod, up, movefocus, u
    bind = $mod, down, movefocus, d
    bind = $mod, Tab,cyclenext,   

    # Groups
    bind = $mod, G, togglegroup
    bind = $mod, O, moveoutofgroup
    bind = $mod Ctrl, left, moveintogroup, l
    bind = $mod Ctrl, right, moveintogroup, r
    bind = $mod Alt, left, changegroupactive, b
    bind = $mod Alt, right, changegroupactive, f
    bind = $mod Ctrl, l, lockactivegroup, toggle

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow

    bind =  ALT, W, submap, move
    submap = move
    bind = , left, movewindow, l
    bind = , right, movewindow, r
    bind = , up, movewindow, u
    bind = , down, movewindow, d
    bind = , escape, submap, reset
    bind = , catchall, submap, reset
    submap = reset
  '';
in
{
  xdg.configFile."hypr/modules/windows.conf".text = config;
}
