{ users, ...}:
{
  imports = [ 
    ./modules
  ];

  home = {
    username = "${users.primary}";
    # homeDirectory = "/home/jonvemo";
    stateVersion = "24.05";
    
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
