{
  description = "Nixos config flake";

  inputs = {
    # NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # HomeManager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Theme
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # APPs
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    way-edges = {
      url = "github:way-edges/way-edges";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zed-editor = {
      url = "github:jonvemo/zed-editor-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fsel = {
      url = "github:Mjoyufull/fsel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs: let
    specialArgs = {
      inherit inputs;
      stateVersion = "25.05";
      hosts = {
        primary = {
          name = "jonvemo";
          system = "x86_64-linux";
        };
      };
      users = {
        primary = {
          name = "jonvemo";
          description = "John Verdugo";
        };
      };
    };
  in {
    nixosConfigurations = import ./host specialArgs;
    homeConfigurations = import ./home specialArgs;
  };
}
