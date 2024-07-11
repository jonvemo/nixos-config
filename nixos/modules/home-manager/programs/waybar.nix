{ config, pkgs, ...}:

{
  programs.waybar = {
    enable = true;

    style = ''
      * {font-family: DejaVu Sans; font-size: 8px;}

      window#waybar {
        border: 0;
        border-radius: 0 0 8px 8px;
      }
      
      window#waybar #window {
        box-shadow: none;
      }

      #workspaces { 
        background-color: transparent;
        padding: 4px 0;
        margin: 0 2px;
      }
      
      #workspaces button {
        font-family: fontawesome;
        min-width: 24px;
        padding: 0 8px;
        margin: 0 2px;
        border-radius: 4px;
      }

      #battery, #pulseaudio, #clock, #memory, #cpu {
        background-color: #E3E6EE;
        min-width: 12px;
        padding: 0 8px;
        margin: 4px 0;
        border-radius: 4px;
        color: #1C1E26;
      }

      #cpu {margin-right: 4px;}

      
    '';

    settings = {
      mainBar = {
#        layer = "top";
#        position = "top";
        width = 1358;
        height = 38;
        spacing = 4;

#        start_hidden = true;
        reload_style_on_change = true;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "tray" "custom/media" ];
        modules-right = [ "battery" "pulseaudio" "clock" "memory" "cpu" "temperature" ];

        "hyprland/workspaces" = {
          "format" = "{windows} <sub>{icon}</sub>";
          "format-window-separator" = "  " /* "\n" */;
          "window-rewrite-default" = "";
          "window-rewrite" = {
            # Desktop
            "nautilus" = "";
            "totem" = "";
            "loupe" = "";
            
            # Browser
            "microsoft-edge" = "";
            "title<.*youtube.*>" = "";
            "title<.*github.*>" = "";
            "title<.*reddit.*>" = "";
            "title<.*facebook.*>" = "";
            "title<.*instagram.*>" = "";
            "title<.*gmail.*" = "";

            # Terminal
            "kitty" = "";

            # Programming
            "code" = "󰨞";
            "figma-linux" = "";

            # APPs
            "vesktop" = "";
            "spotify" = "";
            "steam" = "";
            "g4music" = "";
        
          };
        };

        "custom/media" = {
          "format" = "{icon} {}";
          "return-type" = "json";
          "format-icons" = {
            "Playing" = " ";
            "Paused" = " ";
          };
          "max-length" = 28;
#          "exec" = "playerctl -a metadata --format '{\"text\": \"{{playerName}}: {{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          "exec" = "playerctl -a metadata --format '{\"text\": \"{{artist}}\", \"tooltip\": \"{{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          "on-click" = "playerctl play-pause";
        };

        "tray" = {
          
        };

        "battery" = {
          "format" = "{icon}";
          "format-icons" = {
            "default" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            "charging" = ["󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
          };

          "tooltip-format" = "{capacity}% {timeTo} {health}";

          "states" = {
            "warning" = 30;
            "critical" = 20;
          };
          
        };
        
      };
      
    };
  };
}
