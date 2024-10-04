{ pkgs, ...}:

{
  home.packages = with pkgs; [
    
    # Hyprland
    hyprpaper hyprlock hypridle hyprcursor
    
    # GUI & CTL
    myxer kooha lact
    brightnessctl playerctl grim slurp wl-clipboard cliphist
    ani-cli

    # Tools
    btop tagger /* Music Tagger */ parabolic /* Download Music */
    walker

    # Desktop 
    loupe /* Image Viewer*/ celluloid g4music
    foliate /* Ebook Reader */ sticky-notes pomodoro-gtk
    cozy-drive
    
    gnome-sound-recorder gnome-calculator gnome-connections
    file-roller snapshot tracker-miners /* Herramienta de Indexación de Gnome, sirve para Nautilus y Video Player principalmente */
    nautilus nautilus-python
    newsflash 

    # Browsers
    microsoft-edge # chromium # google-chrome # vivaldi # brave

    # Chatting
    vesktop

    # Games & Web Stuff & Media
    lunar-client osu-lazer-bin
    spotube spotify

    # Learning
    remnote

    # Programming
    bun                    # NOTE Package Manager
    zed-editor             # NOTE Editors
    lazygit woff2 ffmpeg_7 # NOTE Tools

    # Desing & Draw
    figma-linux krita

    # Dumb Stuff
    kittysay
  ];

}
