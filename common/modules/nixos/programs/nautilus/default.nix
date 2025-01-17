{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      nautilus nautilus-python localsearch
    ];
  
    sessionVariables.NAUTILUS_4_EXTENSION_DIR = "${pkgs.nautilus-python}/lib/nautilus/extensions-4";
    pathsToLink = [
      "/share/nautilus-python/extensions"
    ];
    
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };
  
}
