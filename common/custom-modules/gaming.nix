{ config, pkgs, lib, ... }:

let
  cfg = config.gaming;

  gameNames = lib.attrNames cfg.games;

  conditionalPkgs = lib.concatMap (gameName:
    let gameOpts = cfg.games.${gameName};
    in if gameOpts.enable then [ gameOpts.package ] else []
  ) gameNames;

  extraPkgs = cfg.extraPackages;

in {
  options.gaming = {
    enable = lib.mkEnableOption "Enable the gaming configuration module.";

    games = {
      minecraft = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable installation of the Minecraft launcher.";
        };
        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.prismlauncher;
          description = "The package to install for Minecraft (default: Prism Launcher).";
          example = lib.literalExpression "pkgs.lunar-client";
        };
      };

      osu = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable installation of osu!.";
        };
        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.osu-lazer-bin;
          description = "The package to install for osu! (default: osu-lazer-bin).";
        };
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
      type = lib.types.listOf lib.types.package;
      default = [];
      description = "List of additional packages (e.g., pkgs.lutris) to install when the gaming module is enabled.";
      example = lib.literalExpression "[ pkgs.lutris pkgs.heroic-games-launcher ]";
    };
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = conditionalPkgs ++ extraPkgs;

    programs.steam = {
      enable = cfg.steam.enable;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = false;
      dedicatedServer.openFirewall = false;
    };

  };
}
