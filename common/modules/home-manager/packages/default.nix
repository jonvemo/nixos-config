{ pkgs, ...}:

{
  home.packages = with pkgs; [
    
    # Hyprland
    hyprpaper hyprlock hypridle hyprcursor
    
    # GUI & CTL & TUI
    myxer kooha lact
    brightnessctl playerctl grim slurp wl-clipboard cliphist
    ani-cli bluetuith impala

    # Tools
    btop tagger /* Music Tagger */ parabolic /* Download Music */
    walker

    # Desktop 
    loupe /* Image Viewer*/ celluloid g4music
    foliate /* Ebook Reader */ sticky-notes pomodoro-gtk
    cozy-drive
    
    gnome-sound-recorder gnome-calculator gnome-connections
    nautilus nautilus-python localsearch
    file-roller snapshot newsflash

    # Browsers & Chatting
    microsoft-edge # chromium # google-chrome # vivaldi # brave
    vesktop

    # Media & Draw
    spotube
    krita

    # Dumb Stuff
    kittysay
  ];

}
