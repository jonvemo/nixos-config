{ inputs, ... }:

inputs.nixpkgs.lib.nixosSystem rec {
  system = "x86_64-linux";
  
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  specialArgs = { inherit inputs; };
  
  modules = [
    ./configuration.nix
    ../../common/modules/nixos
    
    {
      home-manager = {
        extraSpecialArgs = { inherit inputs; };

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
