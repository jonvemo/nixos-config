{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        # source = "~/.face/face.png"; # NOTE No funciona pipipi
        type = "kitty";
        # height = 14;
        padding.right = 8;
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
