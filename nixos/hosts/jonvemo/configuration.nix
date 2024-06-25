{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    	inputs.home-manager.nixosModules.default
#      inputs.niri-stable.nixosModules.niri
      
    ];
#  nixpkgs.overlays = [ niri.overlays.niri ];
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jonvemo = {
    isNormalUser = true;
    description = "John Verdugo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { 
      "jonvemo" = import ./home.nix;
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "jonvemo";

  environment = {
    systemPackages = with pkgs; [
      # Starter Pack
  	  kitty helix home-manager ags niri alacritty
    ];
    
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
    };
    
  };
  
  system.stateVersion = "23.11"; # Did you read the comment?

}
