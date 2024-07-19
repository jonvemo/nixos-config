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
    hyprpaper hyprlock hypridle libnotify

    # File Manager
    gnome.nautilus # GUI

    # Controls GUI
    networkmanagerapplet myxer lact # pavucontrol
    # Controls CTL
    brightnessctl playerctl grim slurp swappy wl-clipboard # wf-recorder

    # Tools
    fastfetch btop gopsuinfo
    eartag /* Music Tagger */ parabolic /* Download Music */

    # Desktop 
    loupe /* Image Viewer*/ celluloid emote g4music 
    onlyoffice-bin #libreoffice 
    foliate # nwg-panel /* Advanced bar */
    
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

    # Games & Web Stuff
    lunar-client obs-studio

    # Learning
    remnote

    # Programming
    nodejs_22 # yarn # python3

    ## Language Servers for Helix 
    ## NOTE Se pueden instalar desde HomeManager pero obtuve algunos problemas con ello
    ### Idealmente deben ser Instalados en Root
    emmet-ls
    nodePackages.eslint
    nodePackages.prettier
    tailwindcss-language-server
    marksman markdown-oxide # Markdown
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server

    ## Tools
    lazygit

    # Desing & Draw
    figma-linux krita

    # Package Manager
    #cargo #rpm

  ];

}
