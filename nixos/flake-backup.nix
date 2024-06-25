{
  description = "Nixos config flake";

  inputs = {
		# NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		# Window Manager
		nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    hyprland.url = "github:hyprwm/Hyprland";

		niri-unstable.url = "github:YaLTeR/niri";
#    niri-unstable.flake = false;
    niri-stable.url = "github:YaLTeR/niri/v0.1.6";
#    niri-stable.flake = false;

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
		# NixOS
		nixosConfigurations.jonvemo = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			
			modules = [
				./hosts/jonvemo/configuration.nix
				./modules/nixos
				stylix.nixosModules.stylix
#				niri.homeModules.config
				niri.nixosModule.config
			];

			specialArgs = { inherit inputs; };
			
		};
		
		# HomeManager
		homeConfigurations.jonvemo = home-manager.lib.homeManagerConfiguration {
		  pkgs = nixpkgs.legacyPackages."x86_64-linux";

		  modules = [
				./hosts/jonvemo/home.nix
				./modules/home-manager/default.nix
			];

	  	extraSpecialArgs = { inherit inputs; };
		};
		
	};
	
}
