{ pkgs, ...}:

{
  home.packages = with pkgs; [

  # TODO
  # Algunas Aplicaciones tienen que ser movidas
  # a módulos de HomeManager
  # fastfetch git

  # NOTE Minecraft
  # Minecraft: Offical don't work 1.19 or higher version, for olders versions require more packages
  # Prsmlauncher: Auth failed
    
    # GUI
    hyprpaper hyprlock hypridle hyprcursor libnotify walker

    # File Manager
    nautilus # GUI

    # Controls GUI
    networkmanagerapplet myxer lact # pavucontrol
    # Controls CTL
    brightnessctl playerctl grim slurp swappy wl-clipboard # wf-recorder

    # Tools
    btop # gopsuinfo /* System Info */
    eartag /* Music Tagger */ parabolic /* Download Music */

    # Desktop 
    loupe /* Image Viewer*/ celluloid emote g4music pomodoro-gtk
    onlyoffice-bin #libreoffice 
    foliate # nwg-panel /* Advanced bar */
    
    gnome.gnome-sound-recorder file-roller gnome-calculator gnome-connections
    snapshot tracker-miners /* Herramienta de Indexación de Gnome, sirve para Nautilus y Video Player principalmente */
    
    newsflash iotas /* Notes */ # rnote 
    cozy-drive

    # Browsers
    microsoft-edge vivaldi google-chrome

    # Chatting
    vesktop

    # Media
    spotify

    # Games & Web Stuff
    lunar-client obs-studio

    # Learning
    remnote

    # Programming
    nodejs_22

    ## Tools
    ### IDE
    vscode zed-editor
    ### CTL
    lazygit woff2

    # Desing & Draw
    figma-linux krita

    # Package Manager
    #cargo #rpm

    # Dumb Stuff
    kittysay premid

  ];

}
