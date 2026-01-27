{lib,pkgs,pkgs-next,...}:
{
  home.packages = lib.concatLists [ 
  
    (with pkgs; [ 
          
      # Broken in staging-next

    ])
    
    # Last Update (staging-next)
    (with pkgs-next; [

      # Temporal; in case an unstable package (nixos-unstable) fails
    
    ])  
  ];

}
