{user,stateVersion,...}:
{
  imports = [ 
    ./modules
  ];

  home = {
    username = user.name;
    homeDirectory =  "/home/${user.name}";
    stateVersion = stateVersion;
  };

  programs.home-manager.enable = true;
}
