{ lib, pkgs, pkgs-small, ...}:

{
  home.packages = lib.concatLists [ 
  
    (with pkgs; [ 
  
      # Learning
      remnote

    ])
     
    # Last Update (nixos-unstable-small)
    (with pkgs-small; [

      # Programming
      zed-editor           # NOTE Editors
      lazygit woff2 ffmpeg_7 # NOTE Tools

      # Desing
      figma-linux

      # Temporal; in case an unstable package (nixos-unstable) fails
    
    ])  
  ];

}
