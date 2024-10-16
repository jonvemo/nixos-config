let
  config = ''
    bind = $mod, Q, exec, $terminal
    bind = $mod, E, exec, $fileManager
    bind = $mod, W, exec, pkill $bar || $bar
    bind = $mod, R, exec, pkill $menu || $menu
    bind = $mod, B, exec, $browser
    bind = $mod, M, exec, $player
    bind = $mod, D, exec, $discord

    bind = $mod Shift, W, exec, [float; size 576 640], pkill $lightterminal $wifi || $lightterminal $wifi
    bind = $mod Shift, B, exec, [float; size 576 348], pkill $lightterminal $bluetooth || $lightterminal $bluetooth
    bind = $mod Shift, L, exec, $lock

    bind = $mod, F, fullscreen,
    bind = $mod, C, killactive,
  '';
in
{
  xdg.configFile."hypr/modules/programs.conf".text = config;
}