{ pkgs, ...}:

{
  home.packages = with pkgs; [

  # TODO
  # Algunas Aplicaciones tienen que ser movidas
  # a módulos de HomeManager
  # rofi fastfetch git waybar

  # NOTE Minecraft
  # Minecraft: Offical don't work 1.19 or higher version, for olders versions require more packages
  # Prsmlauncher: Auth failed
    
    # GUI
    waybar hyprpaper

    # File Manager
    gnome.nautilus # GUI

    # Controls GUI
    networkmanagerapplet myxer # pavucontrol
    # Controls CTL
    brightnessctl playerctl grim slurp swappy wl-clipboard # wf-recorder 

    # Tools
    fastfetch btop gopsuinfo git
    eartag /* Music Tagger */ parabolic /* Download Music */

    # Desktop 
    loupe /* Image Viewer*/ celluloid emote
    g4music onlyoffice-bin foliate # nwg-panel /* Advanced bar */
    
    /* gnome.totem */ /* Video Player */ gnome.gnome-sound-recorder gnome.file-roller gnome.gnome-calculator
    gnome-connections
    snapshot tracker-miners /* Herramienta de Indexación de Gnome, sirve para Nautilus y Video Player principalmente */
    
    newsflash iotas /* Notes */ # rnote 
    cozy-drive

    # Browsers
    microsoft-edge vivaldi

    # Chatting
    vesktop

    # Media
    spotify

    # Games
    lunar-client

    # Programming
    nodejs_22 # yarn # python3

    # Desing & Draw
    figma-linux krita

    # Package Manager
    #cargo #rpm

  ];

}
