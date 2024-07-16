{ pkgs, ...}:

{
  programs = {
  
    hyprland = {
      enable = true;
      xwayland.enable = true; # NOTE Es requerido para Steam, consume cerca de 87MB
    };

    java = {
      enable = true;
      package = pkgs.jdk22;
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    fish = {
      enable = true;
      # NOTE Requiere Reinicio
      shellAbbrs = {
        npro = "cd /etc/nixos/modules/nixos/programs & sudo hx default.nix";
        hpro = "cd /etc/nixos/modules/home-manager/programs";

        npac = "cd /etc/nixos/modules/nixos/packages & sudo hx default.nix";
        hpac = "cd /etc/nixos/modules/home-manager/packages & sudo hx default.nix";

        nser = "cd /etc/nixos/modules/nixos/services";

        flake = "cd /etc/nixos/ & sudo hx flake.nix";
        jconfig = "cd /etc/nixos/hosts/jonvemo & sudo hx configuration.nix";
        jhome = "cd /etc/nixos/hosts/jonvemo & sudo hx home.nix";

      };
      
    };
    
  };
  
}
