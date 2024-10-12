let 
  config = ''
    general {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      gaps_in = $gapsIn
      gaps_out = $gapsOut
      border_size = $border
      col.active_border = $bg
      col.inactive_border = $inactiveBg

      layout = $layout

      resize_on_border = true
      extend_border_grab_area = 25

      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false
    }

    decoration {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      rounding = $round

      drop_shadow = false
      # col.shadow = $bg
      # col.shadow_inactive = $inactiveBg

      blur {
        enabled = true
        size = 4
        passes = 1

      }

    }

    group {
      # col.border_active = $bg
      # col.border_inactive = $inactiveBg
      # col.border_locked_active = $lockBg
      # col.border_locked_inactive = $inactiveLockBg

      groupbar {
        enabled = true
        font_family = $font
        gradients = false
        render_titles = false

        text_color = $black
        col.active = $bg
        col.inactive = $inactiveBg
        col.locked_active = $lockBg
        col.locked_inactive = $inactiveLockBg

      }
    }

    dwindle {
      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = yes # you probably want this
    }

    master {
      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      # mfact = 0.70 # default 0.55
    }

    misc {
      disable_hyprland_logo = true
      animate_manual_resizes = true
      animate_mouse_windowdragging = false
    }
  '';
in
{
  xdg.configFile."hypr/modules/general.conf".text = config;
}
