{ pkgs, ...}:

{
  programs = {
  
    hyprland = {
      enable = true;
      xwayland.enable = true;
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
    
  };
  
}
