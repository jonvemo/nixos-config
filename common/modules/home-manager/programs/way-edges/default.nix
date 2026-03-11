{ config, inputs, ... }: 
let
  theme = config.lib.stylix.colors;
  font-family = config.stylix.fonts.sansSerif.name;
  font-size = 16;
in { 
  imports = [ inputs.way-edges.homeManagerModules.default ]; 

  programs.way-edges.enable = true;

  xdg.configFile."way-edges/config.kdl".text = ''
    // --- Workspace ---
    workspace {
        namespace "workspace-niri"
        edge "top"
        layer "overlay"
        position "top"
        thickness 8
        length "25%"
        default-color "#${theme.base02}fc"
        active-color "#${theme.base00}fc"
        hover-color "#${theme.base00}fc"
        focus-color "#${theme.base00}fc"
        border-width 0
        border-radius 0
        gap 0
        preset "niri"
    }

    // --- Group - TopRight (Time) ---
    wrap-box {
        namespace "module-topright"
        edge "top"
        layer "overlay"
        position "right"
        gap 4
        margins {
            right 4
        }
        outlook "board" {
            color "#${theme.base02}"
            border-width 0
            border-radius 12
            margins {
                top 8
                left 16
                right 16
                bottom 8
            }
        }
        item "text" {
            font-family "${font-family}"
            font-size ${toString font-size}
            fg-color "#${theme.base07}"
            preset "time" {
                update-interval 60000
                format "%I:%M %p - %A, %B %d"
            }
        }
    }

    // --- Group - RightTop (Stats) ---
    wrap-box {
        namespace "stats"
        edge "right"
        layer "overlay"
        position "top"
        gap 4
        margins {
            top 36
        }
        outlook "board" {
            color "#${theme.base02}"
            border-width 0
            border-radius 12
            margins {
                top 8
                left 16
                right 16
                bottom 8
            }
        }
        
        // Battery
        item "ring" {
            font-family "${font-family}"
            font-size ${toString font-size}
            fg-color "#${theme.base07}"
            radius 12
            prefix "󰁹   "
            suffix " {preset}"
            suffix-hide
            text-transition-ms 600
            preset "battery" {
                update-interval 15000
            }
        }

        // Temperature
        item "ring" {
            font-family "${font-family}"
            font-size ${toString font-size}
            fg-color "#${theme.base07}"
            radius 12
            prefix "   "
            suffix " {float:0,100} °C"
            suffix-hide
            text-transition-ms 600
            preset "custom" {
                cmd "awk '{print $1 / 100000}' /sys/class/thermal/thermal_zone0/temp"
                update-interval 15000
            }
        }

        // RAM
        item "ring" {
            font-family "${font-family}"
            font-size ${toString font-size}
            fg-color "#${theme.base07}"
            radius 12
            prefix "   "
            suffix " {preset}"
            suffix-hide
            text-transition-ms 600
            preset "ram" {
                update-interval 15000
            }
        }
    }
  '';
}
