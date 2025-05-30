{ pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;
    
    settings = {
      theme = "horizon-dark";
      
      editor = {
        cursor-shape.insert = "bar";
        
        bufferline = "multiple"; # always|multiple|never
  
        statusline = {
          left = [ "mode" "spinner" ];
          center = [ "file-name" ];
          right = [ "version-control" "diagnostics" "selections" "position" "file-encoding" "file-line-ending" "file-type" ];
        };

        indent-guides = {
          render = true;
          character = "|";
          skip-levels = 1;
        };

        soft-wrap.enable = true;
        
      };
      
      keys.normal = {
        esc = [ "collapse_selection" "keep_primary_selection" ];
        
        m.w = ":w";
        m.q = ":q";

        m.g = ":sh kitty @ launch --type=window --cwd=current lazygit && kitty @ resize-window --match title:lazygit --axis=horizontal --increment=-20"; 
        m.c = ":sh kitty @ close-window --match title:lazygit";
        m.l = ":sh live-server";
        m.z = ":sh pkill live-server";
      };
      
    };

    extraPackages = lib.concatLists [ 
      (with pkgs; [
        helix-gpt
        dprint
        
       ])
  
      (with pkgs.nodePackages; [
        live-server
        vscode-langservers-extracted
  
      ])  
    ];
    
  };

  xdg.configFile."helix/languages.toml".source = ./languages.toml;
  
}
