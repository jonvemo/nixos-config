{
  Nix = {
    language_servers = [
      "nil" "!nixd"
    ];
    formatter = {
      external = {
        command = "alejandra";
      };
    };
  };

  Markdown = {
    language_servers = [
      "marksman" "markdown-oxide"
    ];
  };
  
}
