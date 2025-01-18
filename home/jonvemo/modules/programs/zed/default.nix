{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;

    extensions = ["nix"];
    extraPackages = with pkgs; [
      biome
      live-server
      marksman
      markdown-oxide

      emmet-language-server
      nodePackages.live-server
      nodePackages.vscode-langservers-extracted

      nixd
      nil
      alejandra
    ];

    userSettings = {
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      vim_mode = true;

      features = {
        inline_completion_provider = "supermaven";
      };

      prettier.allowed = true;

      #formatter = import ./formatter.nix;
      #lsp = import ./lsp.nix
      languages = import ./languages.nix;
      assistant = import ./assistant.nix;
    };
  };
}
