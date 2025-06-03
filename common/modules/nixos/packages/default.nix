{lib,pkgs,pkgs-small,...}:
{
  environment.systemPackages = lib.concatLists [ 
  
    (with pkgs; [ 
    
      # GUI & CTL & TUI
      pwvucontrol kooha lact hyprlock
      brightnessctl playerctl
      bluetuith impala
      internetarchive

      # Tools
      parabolic /* Download Music */ tagger /* Music Tagger */

      # Desktop 
      loupe /* Image Viewer*/ celluloid g4music
      foliate /* Ebook Reader */ sticky-notes pomodoro-gtk
    
      gnome-sound-recorder gnome-calculator gnome-connections
      snapshot ouch

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
