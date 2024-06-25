{config, pkgs, inputs, ...}:

{
  nixpkgs.config = { allowUnfree = true; };

#  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  
  programs = {
  
    hyprland = {
      enable = true;
      xwayland.enable = true;
# #     systemd.enable = true;  
    };

#    niri = {
#      package = pkgs.niri;
#      enable = true;
#    };

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
