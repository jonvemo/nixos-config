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

  };

  outputs = { ... } @ inputs: {
    nixosConfigurations = {
      jonvemo = import ./host/jonvemo { inherit inputs; };
    };

  };

}
