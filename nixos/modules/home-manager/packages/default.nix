{ pkgs, ...}:

{
  home.packages = with pkgs; [

  # TODO
  # Algunas Aplicaciones tienen que ser movidas
  # a módulos de HomeManager

  # NOTE Minecraft
  # Minecraft: Offical don't work 1.19 or higher version, for olders versions require more packages
  # Prsmlauncher: Auth failed
    
    # GUI
    rofi-wayland waybar hyprpaper

    # File Manager
    gnome.nautilus

    # Controls GUI
    networkmanagerapplet myxer
    # Controls CTL
    brightnessctl playerctl grim slurp swappy wl-clipboard #  wl-clip-persist cliphist # wf-recorder 

    # Tools
    fastfetch git
    eartag /* Music Tagger */ parabolic /* Download Music */ 
    loupe /* Image Viewer*/ gnome.totem /* Video Player */ celluloid
    gnome.gnome-sound-recorder emote

    # rnote kooha multiplex komikku

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
    helix vscode

    # Desing
    figma-linux

    # Package Manager
    #cargo #flatpak #rpm
    
  ];
}
