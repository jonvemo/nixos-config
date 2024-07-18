{ pkgs, ... }:

{
  programs.helix = {
  enable = true;
  # settings = {
  #   language-server = {
  #     html = {
  #       command = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-html-languageserver --stdio";
      
  #       # command = "${pkgs.vscode-css-languageserver-bin}/bin/vscode-css-languageserver";
  #     };
  #     #css = {
  #     #  command = "${pkgs.vscode-css-languageserver}/bin/vscode-css-languageserver --stdio";
  #     #};
  #     javascript = {
  #       command = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-json-languageserver --stdio";
  #     };
  #     typescript = {
  #       command = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-json-languageserver --stdio";
  #     };
  #   };
  # };
  };


  home.file.".config/helix/languages.toml".source = ./languages.toml;

}
