{ lib, pkgs, pkgs-small, ...}:

{
  home.packages = lib.concatLists [ 
  
    (with pkgs; [ 

      # Hyprland
      hyprpaper hyprlock hypridle hyprcursor
    
      # GUI & CTL & TUI
      myxer kooha lact
      brightnessctl playerctl grim slurp wl-clipboard cliphist
      ani-cli bluetuith impala

      # Tools
      btop #tagger /* Music Tagger */ 
      parabolic /* Download Music */
      walker

      # Desktop 
      loupe /* Image Viewer*/ celluloid g4music
      foliate /* Ebook Reader */ sticky-notes pomodoro-gtk
      cozy-drive
    
      gnome-sound-recorder gnome-calculator gnome-connections
      nautilus nautilus-python localsearch
      file-roller snapshot newsflash

      # Media & Draw
      spotube
      krita

      # Dumb Stuff
      kittysay

      # Games
      lutris
      lunar-client prismlauncher /* Mods for Lethal Company and others */ 
      osu-lazer-bin
      r2modman

      # Broken on small  
    
    ])
    
    # Last Update (nixos-unstable-small)
    (with pkgs-small; [

      # Browsers & Chatting
      microsoft-edge # chromium # google-chrome # vivaldi # brave
      vesktop

      # Temporal; in case an unstable package (nixos-unstable) fails
    
    ])  
  ];

}
