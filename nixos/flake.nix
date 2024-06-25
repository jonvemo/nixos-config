{
  description = "Nixos config flake";

  inputs = {
		# NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		# Window Manager
		nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    hyprland.url = "github:hyprwm/Hyprland";

#		niri-unstable.url = "github:YaLTeR/niri";
#		niri-stable.url = "github:YaLTeR/niri/v0.1.6";

		# HomeManager
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Addtionals
		stylix.url = "github:danth/stylix";
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
				{	home-manager.users.jonvemo = import ./modules/home-manager;}

#				stylix.nixosModules.stylix
				
			];

			specialArgs = { inherit inputs; };
		};
	};
	
}
