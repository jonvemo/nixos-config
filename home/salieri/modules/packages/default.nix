{ lib, pkgs, pkgs-small, ...}:

{
  home.packages = lib.concatLists [ 
  
    (with pkgs; [

    ])
     
    # Last Update (nixos-unstable-small)
    (with pkgs-small; [

      # Games
      # lunar-client prismlauncher 
      # osu-lazer-bin r2modman /* Mods for Lethal Company and others */ 
      # lutris

      # Temporal; in case an unstable package (nixos-unstable) fails
    
    ])  
  ];

}
