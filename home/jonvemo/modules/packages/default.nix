{ lib, pkgs, pkgs-small, ...}:

{
  home.packages = lib.concatLists [ 
  
    (with pkgs; [
    
      # Programming
  
      # Learning
      remnote

      # Desing
      figma-linux

    ])
     
    # Last Update (nixos-unstable-small)
    (with pkgs-small; [

      # Programming
      lazygit woff2 ffmpeg

      # Temporal; in case an unstable package (nixos-unstable) fails
    
    ])  
  ];

}
