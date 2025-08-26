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
          "server-port" = xxxxx;
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
          
          "plugins/iConomyUnlocked.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/auoxxgxs/versions/53h7ApVw/iConomyUnlocked-0.0.11.jar"; sha512 = "5ae947a7715eb532405f36eda9f782fc964f4514a512515d3d22b3990aa32452032233ecd06e62bf928f768cb5ecb06749f882006fe824e9ca515aa28323a5ec"; };

          "plugins/AdminTools.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/4RSNGDRJ/versions/qlKXdtHW/AdminCommands-1.6.jar"; sha512 = "eb2b17cd5875603f672ef5803761a5ad539bd0b0c9b215b73e8ddba2c308bd03f6881c97ee883d5ee57c0ba3368c8e90056c5f3954b213adcd2b2be3d92219d9"; };

          "plugins/ValhallaMMO.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/rxrgsoud/versions/iXHFAvR2/ValhallaMMO_1.6.jar"; sha512 = "37b5c44035be662879da3eeb56e59908bcf7c484532fbf599f664dafc334f819b196e164de8cb3a39c646189766da535e37799d5a9f5e225dcfcee7729ddc701"; };

          "plugins/ValhallaRaces.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/TfasXXFD/versions/8PHxNAWS/ValhallaRaces_2.2.jar"; sha512 = "d7289362ccb7642262337f1554431851edde28e97a8e70ffde11546ed48873d5c08aa21e60e88646a0dab8625b8dbafbcb3f83ca13bbf548432c684aa2aa829c"; };
          
          "plugins/ValhallaTrinkets.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/XsxeUNHW/versions/AVW93Dt5/ValhallaTrinkets_2.5.jar"; sha512 = "7a219305a97fca5384a8d439ce6fbfefd2c92c8b48604c3832853f510f44710997d6b8e1b3161d513f00d69ab1eb99ee58f70432a0f6a8ef0870156ac8f3cbc9"; };

          "plugins/uJobs.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/5KDx2syH/versions/ihYQWLDK/UJobs-1.0.0.jar"; sha512 = "22b3401e2a1fdae1e67be32d2070067c57cdfb354ce2f38be8d1a4269d591be080b703c3ad5f20718a2ab817b56930cb11f25df3d56230204fe68691373c6d8d"; };

          "plugins/UltimateShop.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/mIaP5HAP/versions/4Xgglr6w/UltimateShop-3.10.1.jar"; sha512 = "3410703989a9d16b74a5443ef8930843e7ab3f2ae2775fbff4319b07f66ab865928b45a5d480961f895721aac290a2f2fc98e61ff89ff1568010faed78737996"; };

          "plugins/BackpackPlus.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/lDAFcnRN/versions/cDjvO9g7/BackpackPlus-1.5.6-beta-all.jar"; sha512 = "bfe05384c31a15d6d281b6ca3637f1d17c790ec8b3047c5c593c7bfdb1697c00ffa6965eeebfe427ec6c941e9a2a1060fa12b9c54af00908bb9c24b3138872e8"; };

          "plugins/SourGraves.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/8ngJlpNI/versions/A6LGeiDe/SourGraves-1.21-2.2.0.jar"; sha512 = "d13488ba4a95e84812aec954f9a96de558739703fce0af402d19ccf22b7b00b2267daec39ed89dfcdc2789de07d52cd74b5f72b26ae59cb5960c217cd6daf04c"; };

          "plugins/ToolStats.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/oBZj9E15/versions/BBTtnFnQ/toolstats-1.9.9.jar"; sha512 = "ba13879e70a71749df064398376e8c495548f5e63faef68aac94bad81d15c9aab20ea85b0e47a046e10d8759a0c432c01fafbf53023a4c496d968fc689c05514"; };

          "plugins/RandomChallange.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/y2V6LOL3/versions/93nLCVbA/randomchallenge-1.29.jar"; sha512 = "17c3402688e6f76dd268a0ed80c4165aabf7a81364475da5046b8915eca3d2be19d5c142bdd2368c495398e59127edbea7c6bf390aeaa5a66cb2a3487c7d0b5f"; };

          # "plugins/TownsAndNations.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/Ag2I6USg/versions/gj5wUNf4/TownsAndNations-0.15.1.jar"; sha512 = "f0874862c62879d5980577c840fc050e204836a9c75e4cf352ba2c62993aa36a90efb453129d8fc1216d2adc1d0e13280d2eda5cf438fde7f32c3591fb0049ea"; };
          
          # "plugins/SphereLib.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/EkYO3Q4N/versions/EexLAoiA/SphereLib-0.5.1.jar"; sha512 = "79acce05496df0aa2b2986acb17cd37bdf5dffe8cc99773bd68f4e774c18cf4a732859760dd2f542deb536bd9fed5c48192844a4d20caab8cca86797fa37a490"; };

          "plugins/CustomNPCs.jar" = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/ptXUpAzg/versions/4AXiIsxB/customnpcs-1.7.5.jar"; sha512 = "a8d1789025e596c67ac1f1f0b475f5f13c47571800333a06b63adc4a6ccb88e85a900c0d100158a9bbf53dc4fd6862a677cb0adcac157724bef56d0b6f0d7551"; };
        };

        files = {
          "plugins/TownsAndNations/config.yml" = ./plugins/TownsAndNations/TownsAndNations.yml;
          "plugins/TownsAndNations/lang.yml" = ./plugins/TownsAndNations/TownsAndNationsLang.yml;
        };
    
      }; /* Server */
    }; /* Servers */
  };

  networking.firewall.allowedTCPPorts = [ xxxxx ]; 
}
