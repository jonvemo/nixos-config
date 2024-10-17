{ pkgs, ...}:

{
  home.packages = with pkgs; [
    
    # Hyprland
    hyprpaper hyprlock hypridle hyprcursor
    
    # GUI & CTL & TUI
    myxer kooha lact
    brightnessctl playerctl grim slurp wl-clipboard # cliphist
    ani-cli bluetuith impala

    # Tools
    # btop tagger /* Music Tagger */ parabolic /* Download Music */
    walker

    # Desktop 
    loupe /* Image Viewer*/ celluloid g4music
    foliate /* Ebook Reader */ sticky-notes pomodoro-gtk
    cozy-drive
    
    gnome-sound-recorder gnome-calculator gnome-connections
    nautilus nautilus-python tracker-miners /* Herramienta de Indexación de Gnome, sirve para Nautilus y Video Player principalmente */
    file-roller snapshot newsflash

    # Browsers & Chatting
    microsoft-edge # chromium # google-chrome # vivaldi # brave
    vesktop

    # Games & Web Stuff & Media
    lunar-client osu-lazer-bin r2modman /* Mod fot Lethal Company */
    spotube

    # Learning
    remnote

    # Programming
    zed-editor             # NOTE Editors
    lazygit woff2 ffmpeg_7 # NOTE Tools

    # Desing & Draw
    figma-linux krita

    # Dumb Stuff
    kittysay
  ];

}
