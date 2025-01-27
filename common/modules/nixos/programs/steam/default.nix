{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = false;
    dedicatedServer.openFirewall = false;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
}
