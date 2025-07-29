{ hosts,stateVersion,... }:
{
  imports = [ 
    ./modules
  ];

  home = {
    username = "${hosts.primary.users.primary.name}";
    stateVersion = "${stateVersion}"; 
  };

}
