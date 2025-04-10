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

4. Copy the files except for `hardware-configuration.nix` to /etc/nixos/ and move the one created by NixOS to /host/USER/

5. Modify the user or users and host in `flake.nix`, `host/HOST/default.nix`, `host/HOST/configuration.nix`, `home/USER/default.nix` and `common/modules/home-manager/settings/gtk.nix`

> [!NOTE]
> Icons Theme and Cursor are not available at the time of installing this repository, you can changeit on .icons folder. Changing also, if you use other icons or cursor, in the `settings/gtk/default.nix` folder and in `programs/hyprland/hyprland.nix`

## Preview
> [!NOTE]
> Preview images may be outdated
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

## Desktop
| Category                | Software & Repository                                                                                                       |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| **Operating System**    | [NixOS Unstable](https://github.com/NixOS/nixpkgs/tree/nixos-unstable)                                                      |
| **Window Manager(s)**   | [Hyprland](https://github.com/hyprwm/Hyprland), [Niri](https://github.com/YaLTeR/niri)                                      |
| **Theme Manager**       | [Stylix](https://github.com/danth/stylix)                                                                                   |
| **File Manager**        | [Nautilus](https://gitlab.gnome.org/GNOME/nautilus)                                                                         |
| **App Launcher**        | [Walker](https://github.com/abenz1267/walker)                                                                               |
| **Terminal Emulator(s)**| [Kitty](https://github.com/kovidgoyal/kitty), [Foot](https://codeberg.org/dnkl/foot)                                        |
| **Shell**               | [Fish](https://github.com/fish-shell/fish-shell)                                                                            |
| **Shell Prompt**        | [Starship](https://github.com/starship/starship)                                                                            |
| **Code Editor**         | [Zed](https://github.com/zed-industries/zed)                                                                                |
| **Terminal Editor**     | [Helix](https://github.com/helix-editor/helix)                                                                              |
| **Bluetooth Manager**   | [Bluetuith](https://github.com/bluetuith-org/bluetuith)                                                                     |
| **Network Manager**     | [Impala](https://github.com/pythops/impala)                                                                                 |
| **Volume Control**      | [Pwvucontrol](https://github.com/saivert/pwvucontrol)                                                                       |
| **Screen Recorder**     | [Kooha](https://github.com/SeaDve/Kooha)                                                                                    |
| **Cloud Storage**       | One Drive (Proprietary / Unofficial client: [abraunegg/onedrive](https://github.com/abraunegg/onedrive))                    |
| **Web Browser**         | [Zen Browser](https://github.com/zen-browser)                                                                               |
| **Music Player(s)**     | [G4Music](https://gitlab.gnome.org/neithern/g4music), [Spotube](https://github.com/KRTirtho/spotube)                        |
| **Video Player**        | [Celluloid](https://github.com/celluloid-player/celluloid)                                                                  |
| **Image Viewer**        | [Loupe](https://gitlab.gnome.org/GNOME/loupe)                                                                               |
| **Notes**               | [Sticky](https://github.com/vixalien/sticky)                                                                                |
