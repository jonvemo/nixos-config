{ inputs, pkgs, ... }:
{  
  imports = [ inputs.walker.nixosModules.default ];

  programs.walker = {
    enable = true;
    # package = pkgs.walker;

    config = {
      theme = "nixos";
      terminal_title_flag = "foot";
      builtins.custom_commands.commands = [
        {
          name = "XWayland Support";
          cmd = "xwayland-satellite";
        }
      ];
    };

    theme = {
      layout =  {
        ui.window.box = {
          max_height = 256;
          min_width = 512;
          height = 256;
          width = 512;

          scroll.list = {
            max_height = 184;
            min_width = 448;
            height = 184;
            width = 448;
          };
          
        };
      };
      
      style = builtins.readFile ./style.css;
    };
  };
  
}
