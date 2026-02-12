{inputs,pkgs,...}:
{
  programs.zed-editor = {
    enable = true;
    package = inputs.zed-editor.packages.${pkgs.system}.zed-editor-preview-bin;

    extensions = [
      "nix" "fish" "toml" "html"
      "biome" "emmet" "markdown-oxide" "liveserver"
      "log"
    ];

    extraPackages = with pkgs; [
      nil alejandra
      biome
      markdown-oxide
    ];

    userSettings = {
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      helix_mode = true;

      prettier.allowed = false;
      format_on_save = "on";

      lsp = import ./lsp.nix;
      languages = import ./languages.nix;
      agent = import ./agent.nix;
    };
  };
}
