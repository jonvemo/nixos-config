{users,...}:
{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      use-xdg-base-directories = true;
      trusted-users = [ "root" "${users.primary.name}" ];
      substituters = import ./substituters;
      trusted-public-keys = import ./trusted-public-keys;
    };
    
    optimise = {
      automatic = true;
      dates = [ "2:00" ];
    };
    
  };
  
}
