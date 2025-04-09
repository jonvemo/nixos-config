{ inputs, pkgs, config, lib, dotfiles, ... }:
{  
  imports = [ inputs.walker.homeManagerModules.default ];
  nix.settings = inputs.walker.nixConfig; # Set Up Cachix

  programs.walker = {
    enable = true;
    package = pkgs.walker;
  };
  xdg.configFile = {
    "walker/themes/gtk.css".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles.programs}walker/gtk.css";
    "walker/themes/gtk.toml".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles.programs}walker/gtk.toml";
  };
  xdg.configFile."walker/config.toml".source = lib.mkForce ./config.toml;
  
}
