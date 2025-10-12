{inputs,pkgs,...}:
{
  environment.systemPackages = with pkgs; [ inputs.fsel.packages.${system}.default ];
}
