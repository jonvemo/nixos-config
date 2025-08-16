{ system,hosts,stateVersion,inputs,pkgs,pkgs-next,... }:

inputs.nixpkgs.lib.nixosSystem {

  inherit pkgs;
  specialArgs = { inherit system hosts stateVersion inputs pkgs-next; };
  
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

          inherit system hosts stateVersion inputs pkgs-next;
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
