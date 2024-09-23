{ pkgs, ...}:

{
  imports = [
    ./fish.nix
    ./nautilus.nix
    ./nh.nix
  ];
  
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

  };
}
