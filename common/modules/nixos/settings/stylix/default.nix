{ config, inputs, pkgs, ... }:

{ 
  imports = [ inputs.stylix.nixosModules.stylix ];
  
  stylix = {
    enable = true;
    
    # NOTE If you want an auto-generated theme from the wallpaper comment this. It's only possible from png, jpg and gif formats
    base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-terminal-dark.yaml";

    fonts = {

      emoji = {
        package = pkgs.noto-fonts-emoji-blob-bin;
        name = "Blobmoji";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      serif = {
        package = pkgs.noto-fonts-lgc-plus;
        name = "Noto Serif";
      };
      sansSerif = {
        package = pkgs.texlivePackages.nunito;
        name = "Nunito";
      };

      sizes = {
        applications = 12;
        desktop = 12;
        popups = 10;
        terminal = 10;
     };
      
    };

    icons = {
      enable = true;
      package = pkgs.adwaita-icon-theme;
      dark = "Adwaita";
    };

    polarity = "dark";

    opacity = {
      applications = 1;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9;
    };

  };
    
}
