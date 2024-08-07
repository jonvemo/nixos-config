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

        soft-wrap = {
          enable = true;
        };
        
      };
      
      keys.normal = {
        m.w = ":w";
        m.q = ":q";

        m.g = ":sh kitty @ launch --type=window --cwd=current lazygit && kitty @ resize-window --match title:lazygit --axis=horizontal --increment=-20"; 
        m.c = ":sh kitty @ close-window --match title:lazygit";
        m.l = ":sh live-server";
        m.z = ":sh pkill live-server";
      };
      
    };

    extraPackages = with pkgs; [
      helix-gpt
      emmet-ls
      dprint
      nodePackages.live-server # mkcert
      nodePackages.eslint
      nodePackages.vscode-langservers-extracted
      nodePackages.typescript-language-server
      tailwindcss-language-server
      marksman markdown-oxide # Markdown
      
      # deno # NOTE typescript-language-server & dprint
      
    ];
    
  };

  home.file.".config/helix/languages.toml".source = ./languages.toml;

}
