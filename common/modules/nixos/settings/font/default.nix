{ pkgs, ... }:
let
  sansSerif = [
    "Nunito"
    "Noto Sans"
    "Noto Sans CJK JP"
    "Noto Sans CJK KR"
    "Noto Sans CJK SC"
    "Noto Sans CJK TC"
    "Noto Sans CJK HK"
  ];
in
{
  fonts = {
    enableDefaultPackages = false;

    packages = with pkgs; [
      noto-fonts-lgc-plus
      noto-fonts-cjk-sans
      noto-fonts-emoji-blob-bin

      nerd-fonts.jetbrains-mono
      texlivePackages.nunito
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        emoji = [ "Blobmoji" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
        serif = sansSerif;
        sansSerif = sansSerif;
      };
    };
  };
}
