{ lib, pkgs, pkgs-small, ...}:

{
  home.packages = lib.concatLists [ 
  
    (with pkgs; [
      figma-linux
    
    ])
     
    (with pkgs-small; [
      lazygit woff2
    
    ])  
  ];

}
