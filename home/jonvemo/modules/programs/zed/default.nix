{ pkgs, ...}:

{
  programs.zed-editor = {
    enable = true;

    extensions = [ "nix" ];
    extraPackages = with pkgs; [
      biome live-server
      marksman markdown-oxide

      emmet-language-server
      nodePackages.live-server
      nodePackages.vscode-langservers-extracted
      
      nixd nil nixfmt-classic
      
    ];
    
    userSettings = {
    
      features = {
        inline_completion_provider = "supermaven";
      };
      
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      
      vim_mode = true;
      
      prettier.allowed = false;

      formatter = import ./formatter.nix;
      languages = import ./languages.nix;
      #lsp = import ./lsp.nix
       
    };
    
  };
  
}
