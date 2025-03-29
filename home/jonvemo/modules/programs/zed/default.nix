{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;

    extensions = ["html" "nix" "fish" "toml" "log" "git-firefly"];
    extraPackages = with pkgs; [
      biome
      live-server
      marksman
      markdown-oxide

      emmet-language-server
      nodePackages.live-server
      nodePackages.vscode-langservers-extracted

      /* Nix */
      nixd
      nil
      alejandra

      /* Go */
      go
      gopls

      /* Rust */
      rust-analyzer
      clippy
      rustfmt
    ];

    userSettings = {
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      vim_mode = true;

      prettier.allowed = true;

      #formatter = import ./formatter.nix;
      #lsp = import ./lsp.nix
      languages = import ./languages.nix;
      assistant = import ./assistant.nix;
    };
  };
}
