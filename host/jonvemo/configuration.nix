{ inputs,users,pkgs,... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default 
  ];  

  users.users = {
    ${users.primary} = {
      isNormalUser = true;
      description = "John Verdugo";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
    };    
  };
      
  system.stateVersion = "24.05";

}
