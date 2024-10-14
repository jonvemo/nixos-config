let
  config = ''
    source = hyprvars.conf

    background {
      monitor = 
      # path = screenshot
      color = $black
    }

    input-field {
        monitor =
        size = 300, 60
        outline_thickness = $border
        dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true
        outer_color = $blue
        inner_color = $white
        font_color = $black
        fade_on_empty = true
        placeholder_text = 󰌾 Logged in as <span text_transform="capitalize"><b>$USER</b></span>
        hide_input = false
        #rounding = $round
        check_color = $green
        fail_color = $red
        fail_text = $FAIL <b>($ATTEMPTS)</b>
    
        position = 0, -35
        halign = center
        valign = center
    }

    # Date
    label {
        monitor = 
        text = cmd[update:43200000] echo "<span text_transform='capitalize'>$(date +"%A, %d %B %Y")</span>"
        color = $white
        font_size = 24
        font_family = $font
        position = -30, -150
        halign = right
        valign = top
    }

    # Time
    label {
        monitor =
        text = cmd[update:30000] echo "$(date +"%R")"
        color = $white
        font_size = 90
        font_family = $font
        position = -30, 0
        halign = right
        valign = top
    }

    # User Avatar
    image {
        monitor = 
        path = ~/.face/face.png 
        size = 100
        border_color = $white

        position = 0, 75
        halign = center
        valign = center
    }

  '';
in
{
  xdg.configFile."hypr/hyprlock.conf".text = config;
}
