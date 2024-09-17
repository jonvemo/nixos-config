{
  nixpkgs.config = {
    allowBroken = false; # NOTE Minecraft
    allowUnsupportedSystem = false; # NOTE ArcBrowser
    allowUnfree = true;
  };
  
  home = {
    username = "jonvemo";
    homeDirectory = "/home/jonvemo";
    stateVersion = "23.11";
    
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
