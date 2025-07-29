{ system,hosts,stateVersion,inputs,pkgs,pkgs-small,... }:

inputs.nixpkgs.lib.nixosSystem {

  inherit pkgs;
  specialArgs = { inherit system hosts stateVersion inputs pkgs-small; };
  
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

          inherit system hosts stateVersion inputs pkgs-small;
        };
        
        users = {
          "${hosts.primary.users.primary.name}".imports = [
            ../../home/${hosts.primary.users.primary.name}
            ../../common/modules/home-manager
          ]; 
        };
        
      };
    }
    
  ];
  
}
