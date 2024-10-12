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

4. Copy the files except for `hardware-configuration.nix` to /etc/nixos/ and move the one created by NixOS to /hosts/USER/

5. Modify the user in `configuration.nix`, `flake.nix`, `hosts/USER/home.nix`, `hosts/USER/default.nix` and `modules/home-manager/settings/gtk.nix`

## Preview
<table>
    <tr>
        <td><img src="https://github.com/user-attachments/assets/c7b06249-0757-42e9-a68a-e0894c57e3c7" width="500" height="281"/></td>
        <td><img src="https://github.com/user-attachments/assets/af77ce40-51f4-477d-a6a7-a29064adab07" width="500" height="281"/></td>
    </tr>
    <tr>
        <td><img src="https://github.com/user-attachments/assets/fcf2bf68-2de9-41b8-9957-6039802179da" width="500" height="281"/></td>
        <td><img src="https://github.com/user-attachments/assets/c3e76b21-3c72-41ba-b5fb-cfa62f77daa9" width="500" height="281"/></td>
    </tr>
</table>

## APPs
* OS: NixOS Unstable
* WM: Hyprland
* AppLauncher: Walker
* FileManager: Nautilus
* Terminal: Kitty
* Shell: Fish
* Editor: Helix and Zed
* Volume: Myxer
* ScreenRecorder: Kooha
* Cloud: Cozy Drive

* Browser: Microsoft Edge
* Video: Celluloid
* Music: Gapples
* Image Viewer: Loupe
* Notes: Sticky Notes

And more...
