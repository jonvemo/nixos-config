{
  programs.fish = {
    enable = true;
    # shellInit = "starship init fish | source";
    interactiveShellInit = "set -g fish_greeting";
  };
  
}
