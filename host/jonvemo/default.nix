{ system, inputs, pkgs, pkgs-small, ... }:

inputs.nixpkgs.lib.nixosSystem {

  inherit pkgs;
  specialArgs = { inherit system inputs pkgs-small; };
  
  modules = [
    ./configuration.nix
    ../../common/modules/nixos
    ../../common/custom-modules
    
    {
      home-manager = {
        backupFileExtension = "test2";

        useGlobalPkgs = true;
        useUserPackages = true;

        extraSpecialArgs = {
          dotfiles = {
            programs = "/etc/nixos/common/modules/home-manager/programs/";
            services = "/etc/nixos/common/modules/home-manager/services/";
          };

          inherit system inputs pkgs-small;
        };
        
        users = {
          jonvemo.imports = [
            ../../home/jonvemo
            ../../common/modules/home-manager
          ];

          salieri.imports = [
            ../../home/salieri
            ../../common/modules/home-manager
          ];  
        };
        
      };
    }
    
  ];
  
}
