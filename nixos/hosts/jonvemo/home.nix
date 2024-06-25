{ config, inputs, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true; # No OpenSource
    allowUnsupportedSystem = true; # For Arc Browser
    allowBroken = true; # For Minecraft
  };
  
  home = {
    username = "jonvemo";
    homeDirectory = "/home/jonvemo";
    stateVersion = "23.11";

#    pointerCursor.gtk.enable = true;
    
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
#  imports = [ inputs.ags ];
}
