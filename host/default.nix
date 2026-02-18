{ inputs, hosts, users, stateVersion, ... }:

let
  inherit (inputs.nixpkgs) lib;

  mkPkgs = system: input: import input {
    inherit system;
    config.allowUnfree = true;
  };

  mkSystem = host: lib.nixosSystem {
    pkgs = mkPkgs host.system inputs.nixpkgs;

    specialArgs = {
      inherit inputs hosts host users stateVersion; 
    };

    modules = [
      ./${host.name} 
    ];
  };

in
lib.mapAttrs' (key: host: 
  lib.nameValuePair host.name (mkSystem host)
) hosts
