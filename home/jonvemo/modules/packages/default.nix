{ lib, pkgs, pkgs-small, ...}:

{
  home.packages = lib.concatLists [ 
  
    (with pkgs; [
    
      # Programming
      zed-editor
  
      # Learning
      remnote

      # Desing
      figma-linux

    ])
     
    # Last Update (nixos-unstable-small)
    (with pkgs-small; [

      # Programming
      lazygit woff2 ffmpeg_7

      # Temporal; in case an unstable package (nixos-unstable) fails
    
    ])  
  ];

}
