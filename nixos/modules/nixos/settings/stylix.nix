{ inputs, pkgs, ... }:

{ 
  imports = [ inputs.stylix.nixosModules.stylix ];
  
  stylix = {
    enable = true;
    homeManagerIntegration.autoImport = true;
    homeManagerIntegration.followSystem = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-terminal-dark.yaml";

    # Misc
    cursor = {
      package = pkgs.catppuccin-cursors.mochaMauve;
      # NOTE No parece funcionar; se habilita el Cursor de Hyprland.
      name = "Catppucin-Mocha-Mauve-Cursors";
      size = 24;
    };
    
    # Fonts
    fonts = {
      # NOTE No permite seleccionar múltiples fonts, así que es paraciamente administrado HomeManager.

      emoji = {
         package = pkgs.noto-fonts-emoji-blob-bin;
         name = "Blobmoji";
       };
       monospace = {
         package = pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; };
         name = "JetBrainsMono Nerd Font";
      };
      # sansSerif = {
      #   packages = pkgs.noto-fonts;
      #   name = "Noto Sans";
      # };
      # serif = {
      #   package = pkgs.noto-fonts;
      #   name = "Noto Serif";
      # };

      sizes = {
        applications = 12;
        desktop = 12;
        popups = 10;
        terminal = 10;
     };
      
    };

    image = ./wallpapers/TM1.png;
#    image = config.lib.stylix.pixel "base0A";
#    image = pkgs.fetchurl {
#      url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
#      sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
#    };

    polarity = "dark";

    opacity = {
      applications = 1;
      desktop = 0.8;
      popups = 0.8;
      terminal = 0.8;
    };
    
  };
}
