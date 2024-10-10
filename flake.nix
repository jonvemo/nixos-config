{
  description = "Nixos config flake";

  inputs = {
		# NixOS
	  nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		# HomeManager
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Theme
		stylix.url = "github:danth/stylix";

  };

	outputs = { nixpkgs, ... } @ inputs:
	{

		# NixOS: Jonvemo
		nixosConfigurations = {
			jonvemo = nixpkgs.lib.nixosSystem rec {
				system = "x86_64-linux";

				pkgs = import nixpkgs {
        	inherit system;
          config.allowUnfree = true;
        };
						
				modules = [
					## NixOS
					./hosts/jonvemo/configuration.nix
					./modules/nixos

					## HomeManager
					{
						home-manager = {
							extraSpecialArgs = { inherit inputs; };

							useGlobalPkgs = true;
							useUserPackages = true;

							users.jonvemo.imports = [ 
								./hosts/jonvemo/home.nix
								./modules/home-manager
			        ];
							
						};
					}
				
				];

				specialArgs = { inherit inputs; };
			};
			
		};
		
	};
	
}
