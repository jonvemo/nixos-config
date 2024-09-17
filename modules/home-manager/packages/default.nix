{ pkgs, ...}:

{
  home.packages = with pkgs; [
    
    # GUI
    hyprpaper hyprlock hypridle hyprcursor libnotify walker

    # Controls GUI
    networkmanagerapplet myxer lact # pavucontrol
    # Controls CTL
    brightnessctl playerctl grim slurp swappy wl-clipboard # wf-recorder

    # Tools
    btop # gopsuinfo /* System Info */
    eartag /* Music Tagger */ parabolic /* Download Music */

    # Desktop 
    loupe /* Image Viewer*/ celluloid emote g4music
    foliate /* Ebook Reader */ # pomodoro-gtk # NOTE Está fallando
    
    gnome-sound-recorder file-roller gnome-calculator gnome-connections
    snapshot tracker-miners /* Herramienta de Indexación de Gnome, sirve para Nautilus y Video Player principalmente */
    
    newsflash iotas /* Notes */ # rnote 
    cozy-drive

    # Browsers
    microsoft-edge # google-chrome # vivaldi # brave

    # Chatting
    vesktop

    # Media
    spotify

    # Games & Web Stuff
    lunar-client osu-lazer-bin
    obs-studio

    # Learning
    remnote

    # Programming
    nodejs_22

    ## Tools
    ### IDE
    vscode zed-editor
    ### CTL
    lazygit woff2 ffmpeg_7

    # Desing & Draw
    figma-linux krita

    # Package Manager
    #cargo #rpm

    # Dumb Stuff
    kittysay premid 

  ];

}
