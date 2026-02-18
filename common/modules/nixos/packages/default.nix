{pkgs,...}:
{
  environment.systemPackages = with pkgs; [ 
          
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
    ffmpeg exiv2 opus-tools
    libheif libavif
    libaom svt-av1 rav1e
    woff2
    lazygit

  ];
}
