{
  Nix = {
    language_servers = [ "nil" ];
    formatter = "language_server";
  };

  JavaScript = {
    language_servers = [ "typescript-language-server" "biome" ];
    formatter = { language_server = { name = "biome"; }; };
  };

  TypeScript = {
    language_servers = [ "typescript-language-server" "biome" ];
    formatter = { language_server = { name = "biome"; }; };
  };

  TSX = {
    language_servers = [ "typescript-language-server" "biome" ];
    formatter = { language_server = { name = "biome"; }; };
  };

  CSS = {
    language_servers = [ "biome" ];
    formatter = "language_server";
  };

}
