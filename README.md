# Helix, Install resume
## Packages requeridos 
Preferiblemente ser instalador dentro de:
environment.systemPackages (Root)
* emmet-ls
* nodePackages.eslint
* nodePackages.prettier
* tailwindcss-language-server
* marksman # Markdown
* markdown-oxide
* nodePackages.vscode-langservers-extracted
* nodePackages.typescript-language-server

Además de 
* kitty # Termianal
* lazygit

![Preview](https://cdn.discordapp.com/attachments/1225127458643251301/1263655389631615039/image.png?ex=669b064a&is=6699b4ca&hm=66963180a34dfdd0146b5a3afa05c1222e2346e3227a15742bff00442f03e0d1&)

## Configuración mínima de Kitty (HomeManager) [Config Completa](https://github.com/jonvemo/nixos-config/blob/main/nixos/modules/home-manager/programs/terminal/kitty.nix)
programs.kitty = {
  enable = true;
  shellIntegration.enableFishIntegration = true;
  settings.allow_remote_control = "yes";
};

Si quieres habilitar starship (HomeManager):
~~~
programs.starship.enable = true;
home.file.".config/starship.toml".source = ./starship.toml;
~~~
[TOML](https://github.com/jonvemo/nixos-config/blob/main/nixos/modules/home-manager/programs/starship/starship.toml)

## Configuración mínima de Helix (HomeManager) [Config Completa](https://github.com/jonvemo/nixos-config/blob/main/nixos/modules/home-manager/programs/helix/default.nix)
~~~
programs.helix = {
  enable = true;
  settings.keys.normal = {
    m.l = ":sh kitty @ launch --type=window --cwd=current lazygit && kitty @ resize-window --match title:lazygit --axis=horizontal --increment=-20"; 
    m.c = ":sh kitty @ close-window --match title:lazygit";
  };
  
};

home.file.".config/helix/languages.toml".source = ./languages.toml; 
~~~
[TOML](https://github.com/jonvemo/nixos-config/blob/main/nixos/modules/home-manager/programs/helix/languages.toml)
