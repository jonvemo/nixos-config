{ pkgs, ...}:

{
  programs = {
  
    hyprland = {
      enable = true;
      xwayland.enable = true; # NOTE Es requerido para Steam, consume cerca de 87MB
    };

    java = {
      enable = true;
      package = pkgs.jdk22;
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    fish.enable = true; # NOTE Necesario mantenerlo para que sea la Shell por Defecto

  };
}
