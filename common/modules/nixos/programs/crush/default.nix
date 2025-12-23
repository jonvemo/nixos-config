{inputs,pkgs,...}:
{
  environment.systemPackages = [
    pkgs.nur.repos.charmbracelet.crush
  ];

}
