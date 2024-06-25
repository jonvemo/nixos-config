{ pkgs, ...}:

{
  home.packages = with pkgs; [

  # TODO
  # Algunas Aplicaciones tienen que ser movidas
  # a módulos de HomeManager

  # NOTE Minecraft
  # Minecraft: Offical don't work 1.19 or higher version, for olders versions require more packages
  # Prsmlauncher: Auth failed

    # Wayland Compositor
#    niri alacritty
    
    # GUI
    rofi-wayland waybar hyprpaper

    # File Manager
    gnome.nautilus

    # for ags # gtksourceview webkitgtk accountsservice

    # Controls GUI
    networkmanagerapplet myxer
    # Controls CTL
    brightnessctl playerctl grim slurp swappy wl-clipboard # wf-recorder 

    # Tools
    fastfetch git
    eartag /* Music Tagger */ parabolic /* Download Music */ 
    loupe /* Image Viewer*/ gnome.totem /* Video Player */ celluloid
    gnome.gnome-sound-recorder

    emote
    

    # Notifications
    mako libnotify # Por alguna razón sigue funcionando; está disponible dbus en los paquetes instalados por HomeManager
    dbus libdbusmenu-gtk3

    # Browsers
    microsoft-edge

    # Chatting
    vesktop

    # Media
    spotify

    # rnote # more interesting

    # kooha multiplex komikku

    # Desing
    # figma-linux # problems in auth

    # Games
    lunar-client 

    # Programming
    python3 nodejs_22 vscode

    # Package Manager
    #cargo #flatpak #rpm
    
  ];
}
