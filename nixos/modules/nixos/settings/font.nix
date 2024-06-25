{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      font-awesome
#      noto-fonts
#      noto-fonts-emoji-blob-bin
    ];

#    fontconfig = {
#      enable = true;
#      defaultFonts = {
#        emoji = [ "Noto Color Emoji" ];
#        monospace = [ "JetBrainsMono Nerd Font" ];
#        serif = [ "Noto Serif" "Noto Serif Japane" ];
#        sansSerif = [ "Noto Sans" "Noto Sans Japanese" ];
#      };
#    };
    
  };
}
