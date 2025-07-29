{ inputs,hosts,stateVersion,pkgs,... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default 
  ];  

  users.users = {
    ${hosts.primary.users.primary.name} = {
      isNormalUser = true;
      description = "${hosts.primary.users.primary.description}";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
    };    
  };

  system.stateVersion = "${stateVersion}";
}
