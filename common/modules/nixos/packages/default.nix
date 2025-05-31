{ lib, pkgs, pkgs-small, ...}:

{
  environment.systemPackages = lib.concatLists [ 
  
    (with pkgs; [ 

      # Hyprland
      hyprlock
    
      # GUI & CTL & TUI
      pwvucontrol kooha lact
      brightnessctl playerctl
      bluetuith impala mako
      internetarchive

      # Tools
      parabolic /* Download Music */ tagger /* Music Tagger */
      satty /* Photo Editor */ fastfetch

      # Desktop 
      loupe /* Image Viewer*/ celluloid g4music
      foliate /* Ebook Reader */ sticky-notes pomodoro-gtk
    
      gnome-sound-recorder gnome-calculator gnome-connections
      snapshot newsflash ouch

      # Media & Draw
      spotube
      krita

      # Games
      prismlauncher
      osu-lazer-bin
      mindustry

      # Browsers & Chatting
      # microsoft-edge # google-chrome # vivaldi # brave
      
      # DevTools
      ffmpeg libheif libavif exiftool
      libaom svt-av1 rav1e
      woff2
      lazygit

      
      # Broken on small  

    ])
    
    # Last Update (nixos-unstable-small)
    (with pkgs-small; [

      # Temporal; in case an unstable package (nixos-unstable) fails
    
    ])  
  ];

}
