{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default 
  ];  

  # NOTE User Permissions and Configuration
  users.users = {
    jonvemo = {
      isNormalUser = true;
      # home = "/home/jonvemo"
      description = "John Verdugo";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
    };

    # WARN Untested
    # salieri = {
    #   isNormalUser = true;
    #   home = "/home/salieri"
    #   description = "Antonio Salieri";
    #   extraGroups = [ "wheel" ];
    #   shell = pkgs.fish;
    # };
    
  };
      
  # NOTE Don't Change
  system.stateVersion = "24.05"; # Did you read the comment?

}
