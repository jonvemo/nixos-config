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
      };
      
    };

    extraPackages = lib.concatLists [ 
      (with pkgs; [
        nil alejandra
        biome
       ])
  
      (with pkgs.nodePackages; [
        vscode-langservers-extracted
      ])
    ];
    
  };

  xdg.configFile."helix/languages.toml".source = ./languages.toml;
  
}
