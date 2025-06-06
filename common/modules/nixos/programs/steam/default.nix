{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = false;
    remotePlay.openFirewall = false;
    dedicatedServer.openFirewall = false;
  };
}
