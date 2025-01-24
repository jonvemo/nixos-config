{ inputs, ... }:
{
  imports = [ inputs.aagl.nixosModules.default ];
  nix.settings = inputs.aagl.nixConfig; # Set Up Cachix
  
  programs.anime-games-launcher.enable = true;
}
