# { pkgs, ... }:

{
  programs.helix = {
    enable = true;
#    defaultEditor = true;

    #  languages = {
    #    language-server = {
    #      typescript-language-server = with pkgs.nodePackages; {
    #        command = "${typescript-language-server}/bin/typescript-language-server";
    #        args = [ "--stdio" "--tsserver-path=${typescript}/lib/node_modules/typescript/lib" ];
    #      };

    #     vscode-css-languageserver-bin = with pkgs.nodePackages; {
    #       command = "${vscode-css-languageserver-bin}/bin/css-languageserver";
    #       args = [ "--stdio" "--css-server-path=${css}/lib/node_modules/css/lib" ];
    #     };
        
    #   };

    #   language = [{
    #     name = "rust";
    #     auto-format = false;
    #   }];

            
    # };

    # extraPackages = with pkgs; [
    #   marksman
    # ];

  };
  
 # home.file.".config/languages.toml".source = ./languages.toml;
    
  
}
