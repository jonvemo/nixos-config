{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];
  

  # NOTE Main NixOS config
  documentation.nixos.enable = false; # NOTE Disable Documentation Package
  nixpkgs.config.allowUnfree = true; # NOTE Steam
  
	nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      # auto-optimise-store = true;
    };
    
    ## NOTE Más información: https://nixos.wiki/wiki/Storage_optimization
    optimise = {
      automatic = true;
      dates = [ "2:00" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    
  };
  

  # NOTE Bootloader config
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = ["ntfs"];
    
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    
    kernelPackages = pkgs.linuxPackages_latest;
  };
  

  # NOTE Permisos y Configuración de Usuario
  # Es necesario configurar la contraseña con ‘passwd’
  # Al habilitar el login de "ssdm" sin este tener configurado
  # autologin será imposible de acceder
  users.users.default = {
    isNormalUser = true;
    description = "Default";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };
  
  # NOTE Dont Change
  system.stateVersion = "23.11"; # Did you read the comment?

}
