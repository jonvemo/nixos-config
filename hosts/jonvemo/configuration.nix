{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default 
  ];  

  # NOTE NixOS config
  documentation = {
    enable = false;
    
    nixos.enable = false; # NOTE Documentation Package

    dev.enable = false; # NOTE Add more information for “doc”, “info” and “man”
    doc.enable = false;
    info.enable = false;
    man = {
      enable = false;
      generateCaches = false;
      man-db.enable = false;
      mandoc.enable = false;
    };
    
  };
  
	nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    
    # NOTE Más información: https://nixos.wiki/wiki/Storage_optimization
    optimise = {
      automatic = true;
      dates = [ "2:00" ];
    };
    
  };

  # NOTE User Permissions and Configuration
  users.users.jonvemo = {
    isNormalUser = true;
    description = "John Verdugo";
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    
  };
      
  # NOTE Don't Change
  system.stateVersion = "24.05"; # Did you read the comment?

}
