{ inputs, lib, ... }:
{  
  imports = [ inputs.walker.homeManagerModules.default ];
  programs.walker = {
    enable = true;
  };
  xdg.configFile = {
    "walker/themes/gtk.css".source = ./gtk.css;
    "walker/themes/gtk.toml".source = ./gtk.toml;
  };
  xdg.configFile."walker/config.toml".source = lib.mkForce ./config.toml;
  
}
