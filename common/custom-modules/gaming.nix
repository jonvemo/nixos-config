# gaming-module.nix
{ config, pkgs, lib, ... }:

let
  cfg = config.gaming;

  conditionalPackages = [
    { cond = cfg.programs.minecraft; pkg = pkgs.prismlauncher; }
    { cond = cfg.programs.osu;       pkg = pkgs.osu-lazer-bin; }
    { cond = cfg.programs.r2modman;  pkg = pkgs.r2modman;      }
    { cond = cfg.programs.umu;       pkg = pkgs.umu-launcher;  }
  ];

  extraPkgs = lib.map (pkgName: pkgs.${pkgName}) cfg.extraPackages;

in {
  options.gaming = {
    enable = lib.mkEnableOption "Enable the gaming configuration module.";

    programs = {
      minecraft = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Install Prism Launcher.";
      };

      osu = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Install osu-lazer-bin.";
      };

      r2modman = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Install r2modman.";
      };

      umu = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Install UMU Launcher.";
      };
    };

    steam = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable and configure Steam using the module's default settings.";
      };
    };

    extraPackages = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "List of additional package names (from pkgs) to install when the gaming module is enabled.";
      example = [ "lutris" "heroic-games-launcher" ];
    };
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages =
      (lib.mapMaybe (p: if p.cond then p.pkg else null) conditionalPackages) ++ extraPkgs;

    programs.steam = lib.mkIf cfg.steam.enable {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = false;
      dedicatedServer.openFirewall = false;
    };

  };
}
