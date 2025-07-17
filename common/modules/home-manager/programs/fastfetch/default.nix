{pkgs,...}:
{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetchMinimal;

    settings = {
      logo.source = "none";
      
      display = {
        key = {
          width = 22;
          type = "both";
        };
          
        separator = "";
      };
      
      modules = [
        "break"
        {
          type = "custom";
          format = "System Information";
        }
        
        "os"
        "kernel"
        "shell"
        "packages"
        
        "break"
        {
          type = "custom";
          format = "Desktop Environment";
        }
        
        "theme"
        "icons"
        "font"
        "cursor"
        "wm"
        "terminal"
        "terminalfont"
        
        "break"
        {
          type = "custom";
          format = "Hardware Information";
        }

        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"

        "break"
        {
          type = "colors";
          symbol = "circle";
        }
      ];

    };

  };
}
