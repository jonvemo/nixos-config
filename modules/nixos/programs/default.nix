{
  imports = [
    ./fish.nix
    ./nautilus.nix
    ./nh.nix
  ];
  
  programs = {
  
    hyprland = {
      enable = true;
      xwayland.enable = true; # NOTE Es requerido para Steam, consume cerca de 87MB, ahora 102MB

    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = false;
      dedicatedServer.openFirewall = false;
    };

  };
}
