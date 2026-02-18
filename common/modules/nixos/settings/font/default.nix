{ lib, pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;

    packages = lib.concatLists [

      (with pkgs; [
        noto-fonts-lgc-plus
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji-blob-bin
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
        monospace = [ "JetBrainsMono Nerd Font" ];
        serif = [
          "Noto Serif"
          "Noto Serif CJK JP"
          "Noto Serif CJK KR"
          "Noto Serif CJK SC"
          "Noto Serif CJK TC"
        ];
        sansSerif = [
          "Nunito"
          "Noto Sans"
          "Noto Sans CJK JP"
          "Noto Sans CJK KR"
          "Noto Sans CJK SC"
          "Noto Sans CJK TC"
        ];
      };
    };
  };
}
