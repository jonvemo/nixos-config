{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default 
  ];
  

  # NOTE NixOS config
  documentation.nixos.enable = false; # NOTE Documentation Package
  
  nixpkgs.config.allowUnfree = true; # NOTE For Steam
  
	nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      # auto-optimise-store = true;
    };
    
    # NOTE Más información: https://nixos.wiki/wiki/Storage_optimization
    optimise = {
      automatic = true;
      dates = [ "2:00" ];
    };

    # NOTE Gestionado por NH program
    # gc = {
    #   automatic = true;
    #   dates = "weekly";
    #   options = "--delete-older-than 4d";
    # };
    
  };
  

  # NOTE Bootloader config
  boot = {
    tmp.cleanOnBoot = true;
    # supportedFilesystems = ["ntfs"]; # NOTE Windows
    
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    
    kernelPackages = pkgs.linuxPackages_latest;
    kernel.sysctl = {
      # TCP hardening
      # Prevent bogus ICMP errors from filling up logs.
      "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
      # Reverse path filtering causes the kernel to do source validation of
      # packets received from all interfaces. This can mitigate IP spoofing.
      "net.ipv4.conf.default.rp_filter" = 1;
      "net.ipv4.conf.all.rp_filter" = 1;
      # Do not accept IP source route packets (we're not a router)
      "net.ipv4.conf.all.accept_source_route" = 0;
      "net.ipv6.conf.all.accept_source_route" = 0;
      # Don't send ICMP redirects (again, we're on a router)
      "net.ipv4.conf.all.send_redirects" = 0;
      "net.ipv4.conf.default.send_redirects" = 0;
      # Refuse ICMP redirects (MITM mitigations)
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv4.conf.default.secure_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;
      # Protects against SYN flood attacks
      "net.ipv4.tcp_syncookies" = 1;
      # Incomplete protection again TIME-WAIT assassination
      "net.ipv4.tcp_rfc1337" = 1;

      # TCP optimization
      # TCP Fast Open is a TCP extension that reduces network latency by packing
      # data in the sender’s initial TCP SYN. Setting 3 = enable TCP Fast Open for
      # both incoming and outgoing connections:
      "net.ipv4.tcp_fastopen" = 3;
      # Bufferbloat mitigations + slight improvement in throughput & latency
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
    };

    blacklistedKernelModules = [
      # Obscure network protocols
      "ax25"
      "netrom"
      "rose"

      # Old or rare or insufficiently audited filesystems
      "adfs"
      "affs"
      "bfs"
      "befs"
      "cramfs"
      "efs"
      "erofs"
      "exofs"
      "freevxfs"
      "f2fs"
      "hfs"
      "hpfs"
      "jfs"
      "minix"
      "omfs"
      "qnx4"
      "qnx6"
      "sysv"
      "ufs"
    ];
    
  };
  

  # NOTE Permisos y Configuración de Usuario
  # Es necesario configurar la contraseña con ‘passwd’
  # Al habilitar el login de "ssdm" sin este tener configurado
  # autologin será imposible de acceder
  users.users.jonvemo = {
    isNormalUser = true;
    description = "John Verdugo";
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      # PKGS

    ];
    
  };
    
  # services.getty.autologinUser = "jonvemo";
  
  # NOTE Dont Change
  system.stateVersion = "23.11"; # Did you read the comment?

}
