let
  config = ''
    # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

    windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.

    windowrulev2 = float, class:($calculator)

    windowrulev2 = float, class:($notes)
    windowrulev2 = pin, class:($notes)
    windowrulev2 = size 416 348, class:($notes) # 348 512
    windowrulev2 = move 945 416, class:($notes) # 1366 768 => 1106 738

    windowrulev2 = float, class:($sound)

    windowrulev2 = float, title:(DevTools)
    windowrulev2 = size 348 512, title:(DevTools)
    windowrulev2 = move 1014 38, title:(DevTools)

    windowrulev2 = float, title:($pomodoro)
    windowrulev2 = pin, title:($pomodoro)
    windowrulev2 = size 302 418, title:($pomodoro)
    windowrulev2 = move 1058 38, title:($pomodoro)

    windowrulev2 = float, title:($miniscreen)
    windowrulev2 = pin, title:($miniscreen)
    windowrulev2 = size 300 169, title:($miniscreen)
    windowrulev2 = move 1058 38, title:($miniscreen)


    workspace = 1, bordersize:2, gapsin:4, gapsout:12 # TEST


    # Change Layout
    bind = $mod CTRL, D, exec, hyprctl keyword general:layout dwindle
    bind = $mod CTRL, M, exec, hyprctl keyword general:layout master
  '';
in
{
  xdg.configFile."hypr/modules/rules.conf".text = config;
}
