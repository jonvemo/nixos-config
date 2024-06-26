{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      font-awesome
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji-blob-bin
      dejavu_fonts
    ];

    # fontconfig = {
    #   enable = true;
    #   defaultFonts = {
    #     emoji = [ "Blobmoji" ];
    #     monospace = [ "JetBrainsMono Nerd Font" "DejaVu Mono" ];
    #     serif = [ "Noto Serif" "Noto Serif Japanese" "Noto Serif Korean" "Noto Serif Chinese" "DejaVu Serif"];
    #     sansSerif = [ "Noto Sans" "Noto Sans Japanese" "Noto Sans Korean" "Noto Sans Chinese" "DejaVu Sans"];
    #   };
    # };
    
  };
}
