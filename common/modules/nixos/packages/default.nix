{lib,pkgs,pkgs-next,...}:
{
  environment.systemPackages = lib.concatLists [ 
  
    (with pkgs; [ 
    
      # GUI & CTL & TUI & CLI
      kooha lact
      brightnessctl playerctl
      wiremix bluetui impala kew /* Music Player */

      # Tools
      parabolic /* Download Music */

      # Desktop 
      loupe /* Image Viewer*/ showtime
      sticky-notes timr-tui
    
      gnome-sound-recorder gnome-calculator # gnome-connections
      snapshot ouch

      # Browsers & Chatting
      microsoft-edge # google-chrome # vivaldi # brave

      # Media & Draw
      krita
      
      # DevTools
      ffmpeg exiftool opusTools
      libheif libavif
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
