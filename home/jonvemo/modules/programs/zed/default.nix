{inputs,pkgs,system,...}:
{
  #imports = [ inputs.zed-editor.packages.${system}.zed-editor-bin ];
  programs.zed-editor = {
    enable = true;
    package = inputs.zed-editor.packages.${system}.zed-editor-preview-bin;

    extensions = [
      "html" "nix" "fish" "toml"
      "biome" "liveserver" "emmet" "marksman" "markdown-oxide"
      "log" "git-firefly"
    ];

    extraPackages = with pkgs; [
      nixd nil
    ];

    userSettings = {
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      vim_mode = false;

      prettier.allowed = true;

      #formatter = import ./formatter.nix;
      #lsp = import ./lsp.nix
      #languages = import ./languages.nix;
      agent = import ./agent.nix;
    };
  };
}
