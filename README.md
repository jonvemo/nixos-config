# NixOS

## Installation
1. Install Git and enable flakes in `configuration.nix`

```nix
environment.systemPackages = with pkgs; [
    git
];
```
```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

2. Rebuild System
```
sudo nixos-rebuild switch
```

3. Clone Repo
```
git clone https://github.com/jonvemo/nixos-config.git
```

4. Copy the files except for `hardware-configuration.nix` to /etc/nixos/

5. Modify the user in `configuration.nix` and `flake.nix`

## Preview
![Screenshot 2024 10-01 at 20:20:12](https://github.com/user-attachments/assets/c7b06249-0757-42e9-a68a-e0894c57e3c7)
![Screenshot 2024 10-01 at 20:21:01](https://github.com/user-attachments/assets/833f54c0-cbf0-4f7e-aaf6-65efcb0a1940)
![Screenshot 2024 10-01 at 20:21:38](https://github.com/user-attachments/assets/af5dfc0e-3563-409e-b3e0-7b91d3aef3fa)
![Screenshot 2024 10-01 at 20:22:16](https://github.com/user-attachments/assets/2ad7387a-e448-41a7-90ef-9e6ccccac73e)


## Hyprland
[Hyprland Config](https://github.com/jonvemo/config-hypr)

## APPs
* OS: NixOS Unstable
* WM: Hyprland
* AppLauncher: Walker
* FileManager: Nautilus
* Terminal: Kitty
* Shell: Fish
* Editor: Helix, Zed, and VSCode
* Volume: Myxer
* ScreenRecorder: Kooha
* Cloud: Cozy Drive

* Video: Celluloid
* Music: Gapples
* Image Viewer: Loupe

And more...
