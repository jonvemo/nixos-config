{ config, pkgs, ...}:

{
  programs.waybar = {
    enable = true;

    style = ''
      * {font-family: JetBrainsMono Nerd Font;}

      window#waybar {
        border-radius: 10px;
        border: 2px solid #B877DB;
      }
      window#waybar #window {
        box-shadow: none;
      }

/*      box.module { padding: 0; background: red;} */

      #workspaces { 
/*        background-color: #FDF0ED; */
        margin: 8px;
/*        border-radius: 16px; */
      }
      
      #workspaces button {
        font-family: fontawesome;
        min-width: 24px;
        padding: 4px 12px;
        margin: 0 2px;
        border-radius: 10px;
      }

      #battery, #pulseaudio, #clock, #memory, #cpu {
        min-width: 24px;
        padding: 0;
        margin: 8px 0;
        border-radius: 10px;
      }

      
    '';

    settings = {
      mainBar = {
#        layer = "top";
#        position = "top";
        width = 1362;
        height = 42;
        spacing = 0;

#        start_hidden = true;
        reload_style_on_change = true;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "tray" ];
        modules-right = [ "battery" "pulseaudio" "clock" "memory" "cpu" ];

        "hyprland/workspaces" = {
          "format" = "{windows} <sub>{icon}</sub>";
          "format-window-separator" = " " /* "\n" */;
          "window-rewrite-default" = "";
          "window-rewrite" = {
            # Desktop
            "nautilus" = "";
            "totem" = "";
            "loupe" = "";
            
            # Browser
            "title<.*youtube.*>" = ""; /* Windows whose titles contain "youtube" */
            "class<microsoft-edge>" = ""; /* Windows whose classes are "firefox" */
            "title<.*github.*>" = ""; /* Windows whose class is "firefox" and title contains "github". Note that "class" always comes first. */
#            "class<microsoft-edge>" = "";
            "microsoft-edge" = "";

            # Terminal
            "kitty" = "";

            # Programming
            "code" = "󰨞";

            # APPs
            "vesktop" = "";
            "spotify" = "";
            "steam" = "";
          };
        };

        "tray" = {
          
        };

        "battery" = {
          "format" = "{icon}";
          "format-icons" = {
            "default" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            "charging" = ["󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
          };

          "states" = {
            "warning" = 30;
            "critical" = 20;
          };
          
        };
        
      };
      
    };
  };
}
