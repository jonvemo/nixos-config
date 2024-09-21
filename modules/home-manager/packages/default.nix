{ pkgs, ...}:

{
  home.packages = with pkgs; [
    
    # GUI
    hyprpaper hyprlock hypridle hyprcursor libnotify walker

    # Controls GUI
    networkmanagerapplet myxer lact
    # Controls CTL
    brightnessctl playerctl grim slurp wl-clipboard # wf-recorder

    # Tools
    btop # gopsuinfo /* System Info */
    eartag /* Music Tagger */ parabolic /* Download Music */

    # Desktop 
    loupe /* Image Viewer*/ celluloid emote g4music
    foliate /* Ebook Reader */ # pomodoro-gtk # NOTE Está fallando
    
    gnome-sound-recorder gnome-calculator gnome-connections
    file-roller snapshot tracker-miners /* Herramienta de Indexación de Gnome, sirve para Nautilus y Video Player principalmente */
    
    newsflash iotas /* Notes */
    cozy-drive

    # Browsers
    microsoft-edge # google-chrome # vivaldi # brave

    # Chatting
    vesktop

    # Games & Web Stuff & Media
    lunar-client osu-lazer-bin
    obs-studio
    spotube spotify

    # Learning
    remnote

    # Programming
    nodejs_22
    vscode zed-editor
    lazygit woff2 ffmpeg_7

    # Desing & Draw
    figma-linux krita

    # Package Manager
    #cargo #rpm

    # Dumb Stuff
    kittysay premid 

  ];

}
