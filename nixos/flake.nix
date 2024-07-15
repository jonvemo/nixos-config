{
  description = "Nixos config flake";

  inputs = {
		# NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		# Window Manager
		nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    hyprland.url = "github:hyprwm/Hyprland";

		# HomeManager
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Theme
		stylix.url = "github:danth/stylix";

		# Additionals
		ags.url = "github:Aylur/ags";

		# APPs
		# None
  };

	outputs = { nixpkgs, home-manager, stylix, ... }@inputs:
	# outputs = { nixpkgs, ... } @ inputs:
	{
		# NixOS: Default
		nixosConfigurations.default = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			
			modules = [
				## NixOS
				./hosts/default/configuration.nix
			  ./modules/nixos

				# HomeManager
				 {
				 	home-manager = {
				 		extraSpecialArgs = { inherit inputs; };
				 		users.default.imports = [ 
				 			./hosts/default/home.nix
				 			#./modules/home-manager
		         ];
				 	};
				 }
				
			];

			specialArgs = { inherit inputs; };
		};

		# NixOS: Jonvemo
		nixosConfigurations.jonvemo = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			
			modules = [
				## NixOS
				./hosts/jonvemo/configuration.nix
				./modules/nixos

				## HomeManager
				{
					home-manager = {
						extraSpecialArgs = { inherit inputs; };
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
	
}
