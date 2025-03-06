{ config, inputs, pkgs, ... }:

{ 
  imports = [ inputs.stylix.nixosModules.stylix ];
  
  stylix = {
    enable = true;
    
    # NOTE If you want an auto-generated theme from the wallpaper comment this. It's only possible from png, jpg and gif formats
    base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-terminal-dark.yaml";

    # Misc
    # cursor = 
      # NOTE Managed by GTK
      
      # package = pkgs.qogir-icon-theme;
      # name = "Qogir Cursors";

    # };
    
    # Fonts
    fonts = {
      # NOTE It does not allow selecting multiple fonts, so it is partially managed by HomeManager.

      emoji = {
         package = pkgs.noto-fonts-emoji-blob-bin;
         name = "Blobmoji";
       };
       monospace = {
         package = pkgs.nerd-fonts.jetbrains-mono;
         name = "JetBrainsMono Nerd Font";
      };

      sizes = {
        applications = 12;
        desktop = 12;
        popups = 10;
        terminal = 10;
     };
      
    };

    image = ./wallpapers/A1.png;

    polarity = "dark";

    opacity = {
      applications = 1;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9;
    };

  };
    
}
