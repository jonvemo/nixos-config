{inputs,...}:
{
  imports = [ inputs.hjem.nixosModules.hjem ];
  hjem.users = {
#    jonvemo = {imports = [ ./hjem/programs ./hjem/services ];};
    jonvemo = import ./hjem;
  };
}
