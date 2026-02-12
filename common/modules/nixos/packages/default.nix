{lib,pkgs,pkgs-next,...}:
{
  environment.systemPackages = lib.concatLists [ 
  
    (with pkgs; [ 
    
      # GUI & CTL & TUI & CLI
      lact
      brightnessctl playerctl libnotify
      wiremix bluetui impala kew timr-tui

      # Tools
      parabolic /* Download Music */

      # Desktop 
      loupe /* Image Viewer*/ showtime
    
      gnome-sound-recorder gnome-calculator # gnome-connections
      snapshot ouch

      # Media & Draw
      krita
      
      # DevTools
      ffmpeg exiv2 opusTools
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
