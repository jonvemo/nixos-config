{lib,pkgs,pkgs-small,...}:
{
  home.packages = lib.concatLists [ 
  
    (with pkgs; [ 
    
      # Media & Draw
      krita

      # Games
      prismlauncher
      osu-lazer-bin
      mindustry
      
      # Broken on small  

    ])
    
    # Last Update (nixos-unstable-small)
    (with pkgs-small; [

      # Temporal; in case an unstable package (nixos-unstable) fails
    
    ])  
  ];

}
