{ inputs, pkgs, lib, ... }:
{
  imports = [ inputs.minecraft-server.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.minecraft-server.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers = {
    
      valhalla = {
        enable = false;
        package = pkgs.paperServers."paper-1_21_7"; 
    
        jvmOpts = "-Xms2G -Xmx4G";
        openFirewall = true;
        restart = "always";
    
        serverProperties = {
          "server-port" = 25566;
          "online-mode" = true;
          "motd" = "¡Servidor Paper de PRUEBAS!";
          "max-players" = 8;
          "level-name" = "icebound_lands";
          "difficulty" = "hard";
          "spawn-protection" = 32;
          "max-world-size" = 5000;
        };

        symlinks = {
          "plugins/LuckPerms.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/Vebnzrzj/versions/ZPtLedoF/LuckPerms-Bukkit-5.5.0.jar"; sha512 = "f12c83c7d33cad7b73d5ddd95f9f07498eda41e273d5dd378ce1b6d37a42ebe3ae023475ab14f63d6336fdb663180708d3685d6559c82836a5deafddf9df2f8c"; };
            
          "plugins/VaultUnlocked.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/ayRaM8J7/versions/GRf9YVFQ/VaultUnlocked-2.15.1.jar"; sha512 = "ed6311573fce5ff767f90bdb417f841b8d989d65501a209e090334510fa5f54321357a39aed909e26a0d705c229a45e8e2a5f94ba63896a24f1c3f50d723fcb4"; };

          "plugins/Essence.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/JQKAIyi1/versions/ggZc4Zca/essence-1.10.0.jar"; sha512 = "e999f913cf631a5a2d7cd418eb44fa6c48c37b4794664f2c09de6e2acc128462a541b783afaf37c60cb7d0b0decdad3535899310be1994074cde7c163e1bf2af"; };

          # "plugins/EssentialsX.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/hXiIvTyT/versions/Oa9ZDzZq/EssentialsX-2.21.2.jar"; sha512 = "0571b015dce84cf03e906c2d498e8bc3827d86debafafb89851517a76c3eec0391b9bb90f6ec4a5f0dbf4c18bee84ead5e354fc0a5be0cc567fdaa9fc8d96c15"; };

          # "plugins/EssentialsXChat.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/2qgyQbO1/versions/BdLUtz0O/EssentialsXChat-2.21.2.jar"; sha512 = "810038dea2d3d70e83370b3a06285b9c39a54931fabeeead4fc154859cb6fe44e190f8c0ef50f17cfeb96221cb7b63699f55f2bc986a83ce077ab0e60f96742f"; };

          # "plugins/EssentialsXSpawn.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/sYpvDxGJ/versions/RVbLg2Am/EssentialsXSpawn-2.21.2.jar"; sha512 = "9f397a20a15fdf96b9abebb226f530d5f4fc77bf92a3823749328d27ef9db7a348b6bfb6d46c819b4770e929177af147f962f07e660cc913d628d4d41f5708bd"; };

          "plugins/uJobs.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/5KDx2syH/versions/ihYQWLDK/UJobs-1.0.0.jar"; sha512 = "22b3401e2a1fdae1e67be32d2070067c57cdfb354ce2f38be8d1a4269d591be080b703c3ad5f20718a2ab817b56930cb11f25df3d56230204fe68691373c6d8d"; };
        };

        files = {
          # "plugins/EssentialsX/config.yml" = ./plugins/EssentialsX/essentialsx.yml;
          "plugins/Essence/config.yml" = ./plugins/Essence/essence.yml;
        };
    
      }; /* Server */
    }; /* Servers */
  };

  networking.firewall.allowedTCPPorts = [ 25566 ]; 
}
