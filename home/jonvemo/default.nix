{ users,stateVersion,... }:
{
  imports = [ 
    ./modules
  ];

  home = {
    username = "${users.primary.name}";
    stateVersion = "${stateVersion}"; 
  };

}
