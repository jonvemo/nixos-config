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

		# APPs
		# jerry.url = "github:justchokingaround/jerry";

	};

	outputs = { nixpkgs, ... } @ inputs: {
		nixosConfigurations = {
			jonvemo = import ./hosts/jonvemo { inherit inputs; };
			# someone = import ./hosts/someone { inherit inputs; };
		};
		
	};
	
}
