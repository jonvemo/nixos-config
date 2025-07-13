{ system, users, inputs, pkgs, pkgs-small, ... }:

inputs.nixpkgs.lib.nixosSystem {

  inherit pkgs;
  specialArgs = { inherit system users inputs pkgs-small; };
  
  modules = [
    ./configuration.nix
    ../../common/modules/nixos
    
    {
      home-manager = {
        backupFileExtension = "backup";

        useGlobalPkgs = true;
        useUserPackages = true;

        extraSpecialArgs = {
          dotfiles = {
            programs = "/etc/nixos/common/modules/home-manager/programs/";
            services = "/etc/nixos/common/modules/home-manager/services/";
          };

          inherit system users inputs pkgs-small;
        };
        
        users = {
          "${users.primary}".imports = [
            ../../home/${users.primary}
            ../../common/modules/home-manager
          ]; 
        };
        
      };
    }
    
  ];
  
}
