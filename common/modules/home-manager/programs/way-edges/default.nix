{ config,inputs,... }: let
  theme = config.lib.stylix.colors;
  font-family = config.stylix.fonts.sansSerif.name;
  # font-size = config.stylix.fonts.sizes.desktop;
  font-size = 16;
in { 
  imports = [ inputs.way-edges.homeManagerModules.default ]; 

  programs.way-edges = {
    enable = true;
    settings = {
      widgets = [
        /*--- Workspace ---*/
        {
          namespace = "workspace-niri";
          type = "workspace";
          edge = "top";
          layer = "overlay";
          position = "top";
          thickness = 24;
          length = "25%";

          default-color = "#${theme.base02}fc";
          active-color = "#${theme.base00}fc";
          hover-color = "#${theme.base00}fc";
          focus-color = "#${theme.base00}fc";
          
          border-width = 0;
          border-radius = 0;
          gap = 0;
          preset.type = "niri";
        }

        /*--- Group - TopRight ---*/
        {
          namespace = "module-topright";
          type = "wrap-box";
          edge = "top";
          layer = "overlay";
          position = "right";
          gap = 4;
          margins.right = 4;
          outlook = {
            type = "board";
            color = "#${theme.base02}";
            border-width = 0;
            border-radius = 12;
            margins = {
              top = 8;
              left = 16;
              right = 16;
              bottom = 8;
            };
          };
          items = [
            /*--- Time ---*/
            {
              type = "text";
              font-family = "${font-family}";
              font-size = font-size;
              fg-color = "#${theme.base07}";
              preset = {
                type = "time";
                update-interval = 60000;
                format = "%I:%M %p - %A, %B %d";
              };
            }
            
          ];
        }

        /*--- Group - RightTop ---*/
        {
          namespace = "stats";
          type = "wrap-box";
          edge = "right";
          layer = "overlay";
          position = "top";
          margins.top = 28;
          gap = 4;

          outlook = {
            type = "board";
            color = "#${theme.base02}";
            border-width = 0;
            border-radius = 12;
            margins = {
              top = 8;
              left = 16;
              right = 16;
              bottom = 8;
            };
          };          
          items = [
            /*--- Battery ---*/
            {
              type = "ring";
              font-family = "${font-family}";
              font-size = font-size;
              fg-color = "#${theme.base07}";
              radius = 12;
              # ring-width = 8;
              prefix = "󰁹   ";
              suffix = " {preset}";
              suffix-hide = true;
              text-transition-ms = 600;
              preset = {
                type = "battery";
                update-interval = 15000;
              };
            }
            /*--- Temperature ---*/
            {
              type = "ring";
              font-family = "${font-family}";
              font-size = font-size;
              fg-color = "#${theme.base07}";
              radius = 12;
              # ring-width = 8;
              prefix = "   ";
              suffix = " {float:0,100} °C";
              suffix-hide = true;
              text-transition-ms = 600;
              preset = {
                type = "custom";
                cmd = "awk '{print $1 / 100000}' /sys/class/thermal/thermal_zone0/temp";
                update-interval = 15000;
              };
            }
            /*--- RAM ---*/
            {
              type = "ring";
              font-family = "${font-family}";
              font-size = font-size;
              fg-color = "#${theme.base07}";
              radius = 12;
              # ring-width = 8;
              prefix = "   ";
              suffix = " {preset}";
              suffix-hide = true;
              text-transition-ms = 600;
              preset = {
                type = "ram";
                update-interval = 15000;
              };
            }
            
          ];
        }

        /*--- END ---*/
      ];
    };
  };
}
