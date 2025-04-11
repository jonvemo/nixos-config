{ lib, pkgs, pkgs-small, ...}:

{
  home.packages = lib.concatLists [ 
  
    (with pkgs; [
    
    ])
     
    (with pkgs-small; [
      lazygit woff2
    
    ])  
  ];

}
