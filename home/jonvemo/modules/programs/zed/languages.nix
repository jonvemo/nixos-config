{
  Nix = {
    language_servers = [
      "nil" "!nixd"
    ];
    formatter = {
      external = {
        command = "nixfmt";
      };
    };
  };

  Markdown = {
    language_servers = [
      "marksman" "markdown-oxide"
    ];
  };
  
}
