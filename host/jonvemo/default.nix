{ system, inputs, pkgs, pkgs-small, ... }:

inputs.nixpkgs.lib.nixosSystem {

  inherit pkgs;
  specialArgs = { inherit system inputs pkgs-small; };
  
  modules = [
    ./configuration.nix
    ../../common/modules/nixos
    
    {
      home-manager = {
        extraSpecialArgs = { inherit inputs pkgs-small; };
        
        backupFileExtension = "testdsj";

        useGlobalPkgs = true;
        useUserPackages = true;
        
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
