{ pkgs, ... }:

{
  fonts = {
    # NOTE Instala DejaVu Fonts por defecto
    # https://github.com/NixOS/nixpkgs/blob/nixos-23.11/nixos/modules/config/fonts/fontconfig.nix
    enableDefaultPackages = false;

    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      font-awesome
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji-blob-bin
      dejavu_fonts
    ];
    
  };
}
