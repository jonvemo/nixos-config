{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        # source = "nixos";
        source = ../../../nixos/settings/stylix/wallpapers/TM1.webp;
        type = "kitty";
        padding = {
          left = 3;
          right = 3;
        };
      };
      modules = [
        {
          type = "custom";
          format = "System Information";
        }
        {
          type = "os";
          key = "OS  ";
        }
        {
          type = "kernel";
          key = "   Kernel";
        }
        {
          type = "shell";
          key = "   Shell";
        }
        {
          type = "packages";
          key = "   Packages";
        }
        "break"
        {
          type = "custom";
          format = "Desktop Environment";
        }
        {
          type = "Theme";
          key = "󰉼   Theme";
        }
        {
          type = "icons";
          key = "   Icons";
        }
        {
          type = "font";
          key = "   Font";
        }
        {
          type = "cursor";
          key = "   Cursor";
        }
        {
          type = "wm";
          key = "   WM";
        }
        {
          type = "terminal";
          key = "   Terminal";
        }
        {
          type = "terminalFont";
          key = "   TerminalFont";
        }
        "break"
        {
          type = "custom";
          format = "Hardware Information";
        }
        {
          type = "cpu";
          key = "   CPU";
        }
        {
          type = "gpu";
          key = "   GPU";
        }
        {
          type = "memory";
          key = "   RAM";
        }
        {
          type = "swap";
        }
        {
          type = "disk";
        }
        "break"
        {
          type = "colors";
          symbol = "circle";
        }
      ];

    };

  };
}
