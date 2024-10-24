let
  config = ''
    $white = rgb(e3e6ee) # or $bg
    $black = rgb(1c1e26)
    $opBlack = rgba(1c1e2690) # TEST
    $red = rgb(e95678)   # or $lockBg
    $yellow = rgb(fab795)
    $green = rgb(29d398)
    $blue = rgb(26bbd9)

    $bg = rgb(e3e6ee)
    $inactiveBg = rgba(e3e6ee80)
    $lockBg = rgb(e95678)
    $inactiveLockBg = rgba(e9567780)

    $fontIcons = JetBrainsMono Nerd Font
    $font = DejaVu Sans

    $round = 8
    $border = 0
    $gapsIn = 2
    $gapsOut = 4

    $layout = master # dwindle / master

    $mod = SUPER

    $lock = hyprlock

    $wifi = impala
    $bluetooth = bluetuith
    $sound = myxer
    $terminal = kitty
    $lightterminal = foot
    $bar = waybar
    $menu = walker
    $fileManager = nautilus
    $browser = microsoft-edge
    $player = spotube
    $discord = vesktop
    $pomodoro = Pomodoro
    $miniscreen = Imagen en imagen # Imagen en imagen / Picture in picture

    # Classes for WindowsRules
    $calculator = org.gnome.Calculator
    $notes = com.vixalien.sticky
  '';
in
{
  xdg.configFile."hypr/hyprvars.conf".text = config;  
}
