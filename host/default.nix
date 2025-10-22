{ inputs, hosts, users, stateVersion, ... }:

let
  pkgsForSystem = system: import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  mkSystem = { host, modules }:
    inputs.nixpkgs.lib.nixosSystem {
      system = host.system;

      pkgs = pkgsForSystem host.system;

      specialArgs = {
        inherit inputs hosts host users stateVersion;
        pkgs-next = pkgsForSystem host.system inputs.nixpkgs-next;
      };

      modules = modules;
    };

  mkHostSystem = host: mkSystem {
    inherit host;
    modules = [ ./${host.name} ];
  };

in
  inputs.nixpkgs.lib.mapAttrs'
    (name: host: inputs.nixpkgs.lib.nameValuePair host.name (mkHostSystem host))
    hosts
