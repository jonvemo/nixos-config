{ lib, pkgs, pkgs-small, ...}:

{
  home.packages = lib.concatLists [ 
  
    (with pkgs; [
      lazygit woff2
    ])
     
    (with pkgs-small; [
      # Temporal; in case an unstable package (nixos-unstable) fails
    
    ])  
  ];

}
