{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        # source = "nixos";
        source = /etc/nixos/modules/nixos/settings/wallpapers/TM1.png;
        type = "kitty-direct";
        width = 48;
        height = 22;
        padding.right = 4;
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
          # circle.range.range-items = [1 3 5 7 9 11 13 15]; # Idk
        }
        "colors"
      ];

    };

  };
}
