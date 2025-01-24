{ inputs, system, ... }:
{
  environment.systemPackages = [
    inputs.zen-browser.packages.${system}.beta
  ];
}
