{lib,pkgs,pkgs-next,...}:
{
  environment.systemPackages = lib.concatLists [ 
  
    (with pkgs; [ 
    
      # GUI & CTL & TUI
      kooha lact
      brightnessctl playerctl
      wiremix bluetui impala
      internetarchive
      rmpc /* Music Player */

      # Tools
      parabolic /* Download Music */

      # Desktop 
      loupe /* Image Viewer*/ showtime g4music
      sticky-notes pomodoro-gtk
    
      gnome-sound-recorder gnome-calculator # gnome-connections
      snapshot ouch

      # Browsers & Chatting
      microsoft-edge # google-chrome # vivaldi # brave

      # Media & Draw
      krita
      
      # DevTools
      ffmpeg libheif libavif exiftool
      libaom svt-av1 rav1e
      woff2
      lazygit

      
      # Broken in staging  

    ])
    
    # Last Update (staging next)
    (with pkgs-next; [

      # Temporal; in case an unstable package (nixos-unstable-small) fails
    
    ])  
  ];

}
