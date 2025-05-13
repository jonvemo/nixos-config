{ inputs, ... }:
{
  imports = [ inputs.aagl.nixosModules.default ];
  nix.settings = inputs.aagl.nixConfig; # Set Up Cachix
  
  programs.sleepy-launcher.enable = true;
}
