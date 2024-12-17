{ lib, pkgs, pkgs-small, ...}:

{
  home.packages = lib.concatLists [ (with pkgs; [ 

    # Hyprland
    hyprpaper hyprlock hypridle hyprcursor
    
    # GUI & CTL & TUI
    myxer kooha lact
    brightnessctl playerctl grim slurp wl-clipboard cliphist
    ani-cli bluetuith impala

    # Tools
    btop tagger /* Music Tagger */ parabolic /* Download Music */

    # Desktop 
    loupe /* Image Viewer*/ celluloid g4music
    foliate /* Ebook Reader */ sticky-notes pomodoro-gtk
    cozy-drive
    
    gnome-sound-recorder gnome-calculator gnome-connections
    nautilus nautilus-python localsearch
    file-roller snapshot newsflash

    # Dumb Stuff
    kittysay
    
    ])
    
    # Last Update (nixos-unstable-small)
    (with pkgs-small; [

      # Browsers & Chatting
      microsoft-edge # chromium # google-chrome # vivaldi # brave
      vesktop

      # Tools
      walker

      # Media & Draw
      spotube
      krita

      # Games
      lunar-client prismlauncher 
      osu-lazer-bin r2modman /* Mods for Lethal Company and others */ 
      lutris

      # Temporal; in case an unstable package (nixos-unstable) fails
    
    ])  
  ];

}
