{
  description = "Nixos config flake";

  inputs = {
    # NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-small.url = "github:NixOS/nixpkgs/nixos-unstable-small";

    # HomeManager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Theme
    stylix.url = "github:danth/stylix";

    # APPs
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    walker = {
      url = "github:abenz1267/walker";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    curd = {
      url = "github:Wraient/curd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";

  };

  outputs = { ... } @ inputs: let
    system = "x86_64-linux";

    common = {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs = import inputs.nixpkgs common;
    pkgs-small = import inputs.nixpkgs-small common;

  in {
    nixosConfigurations = {
      jonvemo = import ./host/jonvemo { inherit system inputs pkgs pkgs-small; };
  };

  };

}
