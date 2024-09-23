{ pkgs, ... }:

{
  imports = [
    ./sound.nix
    ./bluetooth.nix
    ./login.nix
    ./trash.nix
    # ./ssh.nix # NOTE Testing
    # ./flatpak.nix
  ];
}
