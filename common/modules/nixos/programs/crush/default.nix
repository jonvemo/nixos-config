{inputs,...}:
{
  imports = [ inputs.nur.nixosModules.crush ];
  
  programs.crush = {
    enable = true;
    settings = {
      options = {
        skills_paths = [ "./skills" ];
      };
    };
  };
}
