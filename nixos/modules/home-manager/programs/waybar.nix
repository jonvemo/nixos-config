{ config, pkgs, ...}:

{
  programs.waybar = {
    enable = true;

    style = ''
      * {font-family: DejaVu Sans; font-size: 12px;}

      window#waybar {
        background-color: transparent;
        border: 0;
        border-radius: 0 0 8px 8px;
      }
      
      window#waybar #window {
        box-shadow: none;
      }

      #workspaces { 
        background-color: transparent;
        padding: 0;
        margin: 4px 0 0 0;
      }
      
      #workspaces button {
        background-color: #E3E6EE;
        color: #1C1E26;
        min-width: 20px;
        padding: 2px 12px;
        margin: 0 2px;
        border-radius: 8px;
      }

      #workspaces button.active {
        background-color: #cbced0;
      }

      #tray {
        background-color: #1C1E26;
        min-width: 8px;
        padding: 2px 12px;
        margin: 4px 0 0 0;
        border-radius: 8px;
      }

      #battery, #pulseaudio, #clock, #memory, #cpu, #temperature, #network {
        background-color: #E3E6EE;
        min-width: 8px;
        padding: 0 12px;
        margin: 4px 0 0 0;
        border-radius: 8px;
        color: #1C1E26;
      }

      #battery.warning {
        background-color: #fac29a;
      }
      
      #battery.critical {
        background-color: #e95678;
      }

      #battery.charging {
        background-color: #29D398;
      }

      #temperature.critical {
        background-color: #e95678;
      }

      #custom-media {
        background-color: #E3E6EE;
        padding: 0 12px;
        margin: 4px 0 0 0;
        border-radius: 8px;
        color: #1C1E26;
      }

      tooltip {
        background: #2E303E;
        border: none;
        border-radius: 8px;
      }
      
      tooltip label {
        color: #E3E6EE;
        text-shadow: none;
      }
      
    '';

    settings = {
      mainBar = {
#        layer = "top";
#        position = "top";
        width = 1358;
        height = 34;
        spacing = 4;

#        start_hidden = true;
        reload_style_on_change = true;

        modules-left = [ "clock" "pulseaudio" "battery" "custom/media"];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "tray" "memory" "cpu" "temperature" ];

#         "clock" = {
#           "format" = "{:%I:%M %p}";
# #          "tooltip-format" = "{:A% d%, b%. C%}";
#           #"tooltip-format" = "{:I%}";
#           "tooltip" = "true";
#         };

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
                              "today" =      "<span color='#e95678'><b><u>{}</u></b></span>";
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
          "format-window-separator" = "  " /* "\n" */;
          "window-rewrite-default" = "";
          "window-rewrite" = {
            # Desktop
            "class<nautilus>" = "";
            "class<totem>" = "";
            "class<loupe>" = "";
            
            # Browser # class<firefox> title ...
            "class<microsoft-edge>" = "";
            "title<.*youtube.*>" = "";
            "title<.*github.*>" = "";
            "title<.*reddit.*>" = "";
            "title<.*facebook.*>" = "";
            "title<.*instagram.*>" = "";
            "title<.*gmail.*" = "";

            # Terminal
            "class<kitty>" = "";

            # Programming
            "class<code>" = "󰨞";
            "class<figma*>" = "";

            # APPs
            "class<vesktop>" = "";
            "spotify" = "";
            "class<steam>" = "";
            "class<g4music>" = "";
        
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
          "format-wifi" = "  {bandwidthDownBits}   {bandwidthUpBits}";
          "format-ethernet" = " {ifname}: {ipaddr}/{cidr}";
          "format-disconnected" = "⚠ Disconnected";
          "tooltip-format" = "{essid}";
          # "max-length" = 6;
          "interval" = "10";
        };

        "memory" = {
          "format" = "{used:0.1f}G ";
          "tooltip" = false;
        };

        "cpu" = {
          "format" = "{usage}%  ";
          "tooltip" = false;
        };

        "battery" = {
          "format" = "{icon}";
          "format-icons" = {
            "default" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            "charging" = ["󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
          };

          "tooltip-format" = "{capacity}% \n{timeTo} \nHealth: {health}";

          "states" = {
            "warning" = 40;
            "critical" = 25;
          };
          
        };

        "pulseaudio" = {
        # "scroll-step": 1, // %, can be a float
          "reverse-scrolling" = 1;
          "format" = "{icon} {volume}% {format_source}";
          # "format" = "{icon}  {format_source}";
          # "format-bluetooth" = "{icon} {volume}%  {format_source}";
          # "format-bluetooth-muted" = "󰂲 {icon}  {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = " {volume}%";
          # "format-source" = "";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [" " " " "  "];
          };
          "tooltip-format" = "Volume {volume}% \n{desc}";
          "on-click" = "myxer";
        };

        "temperature" = {
          "critical-threshold" = 80;
          "format" = "{temperatureC}°C {icon}";
          "format-icons" = ["" "" "" "" ""];
          "tooltip" = false;
        };
        
      };
      
    };
  };
}
