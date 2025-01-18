{ lib, pkgs, ... }:

{
  fonts = {
    # NOTE Instala DejaVu Fonts por defecto
    # https://github.com/NixOS/nixpkgs/blob/nixos-23.11/nixos/modules/config/fonts/fontconfig.nix
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
    
  };
}
