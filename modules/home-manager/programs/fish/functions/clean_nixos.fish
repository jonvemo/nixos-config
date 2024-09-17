#!/usr/bin/env fish

nix-env --delete-generations old
sudo nix-collect-garbage -d
sudo nix-store --optimise
sudo nixos-rebuild switch --flake /etc/nixos#jonvemo
