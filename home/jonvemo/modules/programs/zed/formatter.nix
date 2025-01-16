{
  # WARN Formatea todo el repositorio
  # INFO Language Support: js, ts, jsx, json, jsonc, css, graphQL
  # https://biomejs.dev/internals/language-support/
  external = {
    command = "biome";
    arguments = [ "format" "--fix" ];
  };

}
