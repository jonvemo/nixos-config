{ inputs, hosts, users, stateVersion, ... }:

let
  inherit (inputs.nixpkgs) lib;

  mkPkgs = system: import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  mkHome = { user, host }: inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = mkPkgs host.system;

    extraSpecialArgs = {
      inherit inputs users user host stateVersion;
      dotfiles = {
        programs = "/etc/nixos/common/modules/home-manager/programs/";
        services = "/etc/nixos/common/modules/home-manager/services/";
      };
    };

    modules = [
      ./${user.name}
      ../common/modules/home-manager
    ];
  };

  genHomesForHost = host: 
    lib.mapAttrs' (userName: user: 
      lib.nameValuePair "${user.name}@${host.name}" (mkHome { inherit user host; })
    ) users;

in
lib.concatMapAttrs (hostName: host: genHomesForHost host) hosts
