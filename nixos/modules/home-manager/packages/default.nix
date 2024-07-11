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
    rofi-wayland waybar hyprpaper

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
    g4music onlyoffice-bin nwg-panel
    
    /* gnome.totem */ /* Video Player */ gnome.gnome-sound-recorder gnome.file-roller gnome.gnome-calculator
    gnome-connections
    snapshot tracker-miners /* Herramienta de Indexación de Gnome, sirve para Nautilus y Video Player principalmente */
    
    newsflash iotas # valent
    cozy-drive

    # kooha # WARN No Funciona
    # multiplex # 9WARN No entiendo como funciona
    # rnote

    # Browsers
    microsoft-edge

    # Chatting
    vesktop

    # Media
    spotify

    # Games
    lunar-client

    # Programming
    python3 nodejs_22

    # Desing
    figma-linux

    # Package Manager
    #cargo #flatpak #rpm

  ];

}
