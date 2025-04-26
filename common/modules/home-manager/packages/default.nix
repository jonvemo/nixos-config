{ lib, pkgs, pkgs-small, ...}:

{
  home.packages = lib.concatLists [ 
  
    (with pkgs; [ 

      # Hyprland
      hyprpaper hyprlock hypridle
    
      # GUI & CTL & TUI
      pwvucontrol kooha lact
      brightnessctl playerctl
      bluetuith impala
      internetarchive

      # Tools
      parabolic /* Download Music */ tagger /* Music Tagger */
      satty /* Photo Editor */

      # Desktop 
      loupe /* Image Viewer*/ celluloid g4music
      foliate /* Ebook Reader */ sticky-notes pomodoro-gtk
    
      gnome-sound-recorder gnome-calculator gnome-connections
      file-roller snapshot newsflash

      # Media & Draw
      spotube
      krita

      # Games
      prismlauncher
      osu-lazer-bin
      r2modman /* Mods for Lethal Company and others */  

      # Browsers & Chatting
      # microsoft-edge # google-chrome # vivaldi # brave
      
      # Broken on small  

    ])
    
    # Last Update (nixos-unstable-small)
    (with pkgs-small; [

      # Tools
      ffmpeg libheif libavif exiftool
      libaom svt-av1 rav1e

      # Temporal; in case an unstable package (nixos-unstable) fails
    
    ])  
  ];

}
