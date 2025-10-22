{ inputs, hosts, users, stateVersion, ... }:

let
  pkgsForSystem = system: import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  mkHome = { user, system, modules }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsForSystem system;
      
      extraSpecialArgs = {
        inherit inputs users user stateVersion;
        dotfiles = {
          programs = "/etc/nixos/common/modules/home-manager/programs/";
          services = "/etc/nixos/common/modules/home-manager/services/";
        };
      };
      
      modules = modules;
    };

  mkUserHome = system: user: mkHome {
    inherit user system;
    modules = [
      ./${user.name} 
      ../common/modules/home-manager 
    ];
  };

  homesForHost = host:
    inputs.nixpkgs.lib.mapAttrs'
      (userName: user: 
        inputs.nixpkgs.lib.nameValuePair 
          "${user.name}@${host.name}" 
          (mkUserHome host.system user)
      )
      users;

in
  inputs.nixpkgs.lib.foldl'
    (acc: host: acc // homesForHost host)
    {}
    (builtins.attrValues hosts)
