{ config, ... }: let
  image = [ "org.gnome.Loupe.desktop" ];
  video = [ "org.gnome.Showtime.desktop" ];
  browser = [ "zen-beta.desktop" ];
  editor = [ "dev.zed.Zed-Preview.desktop" ];
in {
  xdg = {
    mime = {
      enable = true;
      defaultApplications = {

        "image/png" = image;
        "image/jpeg" = image;
        "image/gif" = image;
        "image/webp" = image;
        "image/avif" = image;
        "image/heic" = image;

        "video/mp4" = video;
        "video/webm" = video;
        "video/mkv" = video;
                
        "text/html" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/ftp" = browser;
        "x-scheme-handler/about" = browser;
        "x-scheme-handler/unknown" = browser;
        "application/xhtml+xml" = browser;
        "application/x-extension-htm" = browser;
        "application/x-extension-html" = browser;
        "application/x-extension-shtml" = browser;
        "application/x-extension-xhtml" = browser;
        "application/x-extension-xht" = browser;
        "application/pdf" = browser;

        "application/json" = editor;
        "application/xml" = editor;
        "text/plain" = editor;
        "text/markdown" = editor;
        "text/csv" = editor;
      };
    };
    
  };
}
