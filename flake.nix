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
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    curd.url = "github:Wraient/curd";
    walker.url = "github:abenz1267/walker";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";

  };

  outputs = { ... } @ inputs: let
    system = "x86_64-linux";

    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    # Enable packages of nixos-unstable-small for HomeManager
    pkgs-small = import inputs.nixpkgs-small {
      inherit system;
      config.allowUnfree = true;
    };

  in {
    nixosConfigurations = {
      jonvemo = import ./host/jonvemo { inherit system inputs pkgs pkgs-small; };
    };

  };

}
