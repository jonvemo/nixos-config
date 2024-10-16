{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        width = 1358;
        height = 34;
        spacing = 0;

        reload_style_on_change = true;

        modules-left = [ "custom/media" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "tray" "clock" "pulseaudio" "network" "battery" "temperature" ];

        "clock" = {
            "format" = "{:%I:%M %p}";
            "format-alt" = "{:%A, %B %d. %Y}";
            "tooltip-format" = "<tt>{calendar}</tt>";
            "calendar" = {
                        "mode"          = "month";
                        "mode-mon-col"  = 3;
                        "weeks-pos"     = "right";
                        "on-scroll"     = 1;
                        "format" = {
                                  "months" =     "<span color='#e3e6ee'><b>{}</b></span>";
                                  "days" =       "<span color='#cbced0'><b>{}</b></span>";
                                  "weeks" =      "<span color='#26bbd9'><b>W{}</b></span>";
                                  "weekdays" =   "<span color='#fab795'><b>{}</b></span>";
                                  "today" =      "<span color='#e95678'><b>{}</b></span>";
                                  };
                        };
            "actions" =  {
                        "on-click-right" = "mode";
                        "on-click-forward" = "tz_up";
                        "on-click-backward" = "tz_down";
                        "on-scroll-up" = "shift_up";
                        "on-scroll-down" = "shift_down";
                        };
        };

        "hyprland/workspaces" = {
          "format" = "{windows} <sub>{icon}</sub>";
          "format-window-separator" = "  ";
          "window-rewrite-default" = "";
          "window-rewrite" = {
            # Desktop
            "class<org.gnome.Nautilus>" = "";
            "class<io.github.celluloid_player.Celluloid>" = "";
            "class<org.gnome.Loupe>" = "";
            
            # Browser # class<firefox> title ...
            "class<microsoft-edge>" = "";
            "class<microsoft-edge> title<*.youtube.*>" = "";
            "title<*.github.*>" = "";
            "title<*.reddit.*>" = "";
            "class<microsoft-edge> title<*.facebook.*>" = "";
            "title<*.instagram.*>" = "";
            "title<*.gmail.*" = "";

            # Terminal
            "class<kitty>" = "";

            # Programming
            "class<code>" = "󰨞";
            "class<figma-linux>" = "";

            # Study
            "class<RemNote>" = "RN";

            # APPs
            "class<vesktop>" = "";
            "class<spotify>" = "";
            "class<steam>" = "";
            "class<g4music>" = "";
        
          };
          
          "persistent-workspaces" = {
            "eDP-1" = [ 1 10 ];
          };
        };

        "custom/media" = {
          "format" = "󰎇 {}";
          "return-type" = "json";
          "max-length" = 14;
          "exec" = "playerctl -a metadata --format '{\"text\": \"{{artist}}\", \"tooltip\": \"{{artist}} - {{markup_escape(title)}} {{album}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          "on-click" = "playerctl play-pause";
          "on-double-click" = "playerctl next";
          "on-triple-click" = "playerctl previous";
        };

        "tray" =  {
          "icon-size" = 12;
          "spacing" = 8;
        };

        "network" = {
          "format-wifi" = "{icon} ";
          "format-ethernet" = " {ifname}: {ipaddr}/{cidr}";
          "format-icons" = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          "format-disconnected" = "󰖪";
          "format-alt" = "󱛇";
          "tooltip-format" = "{essid}";
          # "max-length" = 6;
          "interval" = "10";
        };

        "battery" = {
          "format" = "{icon}";
          "format-icons" = {
            "default" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            "charging" = ["󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
          };

          "tooltip-format" = "Battery {capacity}% \n{timeTo} \nHealth: {health}";

          "states" = {
            "warning" = 40;
            "critical" = 25;
          };
          
        };

        "pulseaudio" = {
          "format" = "{icon}";
          "format-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
          };
          "tooltip-format" = "Volume {volume}% \n{desc}";
          "on-click" = "myxer";
        };

        "temperature" = {
          "critical-threshold" = 80;
          "format" = "{icon}";
          "format-icons" = ["" "" "" "" ""];
        };
        
      };
      
    };
    
  };

  home.file.".config/waybar/style.css".source = ./style.css;
}
