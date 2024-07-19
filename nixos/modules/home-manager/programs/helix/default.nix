{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    
    settings = {
      theme = "horizon-dark";
      
      editor = {
        bufferline = "multiple"; # always|multiple|never
  
        statusline = {
          left = [ "mode" "spinner" ];
          center = [ "file-name" ];
          right = [ "version-control" "diagnostics" "selections" "position" "file-encoding" "file-line-ending" "file-type" ];
        };

        indent-guides = {
          render = true;
          character = "╎";
          skip-levels = 1;
        };
        
      };
      
      keys.normal = {
        space.w = ":w";
        space.q = ":q";

        m.l = ":sh kitty @ launch --type=window --cwd=current lazygit && kitty @ resize-window --match title:lazygit --axis=horizontal --increment=-20"; 
        m.c = ":sh kitty @ close-window --match title:lazygit";
      };
      
    };
    
  };


  home.file.".config/helix/languages.toml".source = ./languages.toml;

}
