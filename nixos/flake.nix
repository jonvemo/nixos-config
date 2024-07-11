{
  description = "Nixos config flake";

  inputs = {
		# NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		# Window Manager
		nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    hyprland.url = "github:hyprwm/Hyprland";

#		niri-unstable.url = "github:YaLTeR/niri"; # NOTE No hay módulos disponibles
#		niri-stable.url = "github:YaLTeR/niri/v0.1.6";

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

	outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: 
	{
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
