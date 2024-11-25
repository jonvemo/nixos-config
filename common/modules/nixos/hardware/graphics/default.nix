{
  hardware = {
    graphics.enable = true;

    # NOTE Enable "xserver" too
      # https://github.com/NixOS/nixpkgs/blob/7eee17a8a5868ecf596bbb8c8beb527253ea8f4d/nixos/modules/services/hardware/amdvlk.nix
    # amdgpu.amdvlk.enable = true;
  };
}
