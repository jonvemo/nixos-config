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
    ../../modules/nixos
    
    {
      home-manager = {
        extraSpecialArgs = { inherit inputs; };

        useGlobalPkgs = true;
        useUserPackages = true;
        users.jonvemo.imports = [
          ./home.nix
          ../../modules/home-manager
        ];
      };
    }
    
  ];
  
}
