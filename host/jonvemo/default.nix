{ hosts,users,system,stateVersion,inputs,pkgs,pkgs-next,... }:
inputs.nixpkgs.lib.nixosSystem {

  inherit pkgs;
  specialArgs = { inherit hosts users system stateVersion inputs pkgs-next; };
  
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

          inherit hosts users system stateVersion inputs pkgs-next;
        };
        
        users = {
          "${users.primary.name}".imports = [
            ../../home/${users.primary.name}
            ../../common/modules/home-manager
          ]; 
        };
        
      };
    }
    
  ];
  
}
