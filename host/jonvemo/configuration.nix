{ inputs,users,stateVersion,pkgs,... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default 
  ];  

  users.users = {
    ${users.primary.name} = {
      isNormalUser = true;
      description = "${users.primary.description}";
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
    };
  };

  system.stateVersion = "${stateVersion}";
}
