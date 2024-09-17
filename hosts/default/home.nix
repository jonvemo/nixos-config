{ pkgs, ... }:

{
  nixpkgs.config = {
    allowBroken = true; # NOTE Minecraft
    allowUnsupportedSystem = true; # NOTE ArcBrowser
    allowUnfree = true;
  };
  
  home = {
    username = "default";
    homeDirectory = "/home/default";
    stateVersion = "23.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
