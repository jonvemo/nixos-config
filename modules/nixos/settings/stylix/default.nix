{ config, inputs, pkgs, ... }:

{ 
  imports = [ inputs.stylix.nixosModules.stylix ];
  
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-terminal-dark.yaml";

    # Misc
    # cursor = {
      # NOTE Sólo admite cursor acompañado con el Package
      # Actualmente gestionado por GTK para elementos personalizados
      
      # package = pkgs.qogir-icon-theme;
      # name = "Qogir Cursors";

    # };
    
    # Fonts
    fonts = {
      # NOTE No permite seleccionar múltiples fonts, así que es paracialmente administrado por HomeManager.

      emoji = {
         package = pkgs.noto-fonts-emoji-blob-bin;
         name = "Blobmoji";
       };
       monospace = {
         package = pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; };
         name = "JetBrainsMono Nerd Font";
      };

      sizes = {
        applications = 12;
        desktop = 12;
        popups = 10;
        terminal = 10;
     };
      
    };

    image = ./wallpapers/TM2.png;
#    image = config.lib.stylix.pixel "base0A";
#    image = pkgs.fetchurl {
#      url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
#      sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
#    };

    polarity = "dark"; # ¿No parece funcionar adecuamente?

    opacity = {
      applications = 1;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9;
    };

  };
    
}
