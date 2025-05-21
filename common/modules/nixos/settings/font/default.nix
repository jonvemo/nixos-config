{ lib, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = false;

    packages = lib.concatLists [ 
    
      (with pkgs; [
        font-awesome
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji-blob-bin
        dejavu_fonts
        
      ])
      
      (with pkgs.nerd-fonts; [
        jetbrains-mono
        
      ])

      (with pkgs.texlivePackages; [
        nunito
        
      ])
      
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        emoji = [ "Blobmoji" ];
        monospace = [ "JetBrainsMono Nerd Font" "DejaVu Sans Mono"];
        serif = [ "Noto Serif" "Noto Serif Japanese" "Noto Serif Korean" "Noto Serif Chinese" "DejaVu Serif"];
        sansSerif = [ "Nunito" "Noto Sans" "Noto Sans Japanese" "Noto Sans Korean" "Noto Sans Chinese" "DejaVu Sans"];
      };
    };
    
  };
}
