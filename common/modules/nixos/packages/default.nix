{lib,pkgs,pkgs-next,...}:
{
  environment.systemPackages = lib.concatLists [ 
  
    (with pkgs; [ 
          
      # Desktop 
      brightnessctl playerctl libnotify
      wiremix bluetui impala kew timr-tui

      lact
      loupe /* Image Viewer*/ showtime snapshot
      gnome-calculator # gnome-connections

      krita

      # Tools
      yt-dlp ouch
      
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
