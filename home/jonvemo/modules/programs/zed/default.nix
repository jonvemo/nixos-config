{ pkgs, ...}:

{
  programs.zed-editor = {
    enable = true;

    extensions = [ "nix" ];
    extraPackages = with pkgs; [
      biome dprint live-server
      marksman markdown-oxide

      emmet-language-server
      nodePackages.live-server
      nodePackages.vscode-langservers-extracted
      
      nixd nil nixfmt-classic
      
    ];
    
    userSettings = {
      "features" = {
        "inline_completion_provider" = "supermaven";
      };
      "telemetry" = {
        "diagnostics" = false;
        "metrics" = false;
      };
      "vim_mode" = true;

      languages = import ./languages.nix;
       
    };
    
  };
  
}
