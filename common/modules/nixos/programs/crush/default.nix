{inputs,...}:
{
  imports = [ inputs.nur.nixosModules.crush ];
  
  programs.crush = {
    enable = true;
  };
}
