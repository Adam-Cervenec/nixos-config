# About

This project focuses on a reproducible NixOS configuration built around Hyprland and Stylix. The main idea is to make the OS and user interface reproducible and reliable.

## Stucture

### flake.nix
flake.nix is the main entry point of the configuration. It dynamically loads workstation configurations from the hosts directory based on hostname and the corresponding folder name.

#### host.nix
host.nix is mainly hardware and unique PC-based configuration e.g. monitors, GPU... and global settings that are shared for the same use - settings/profiles, settings/presets and settings/styles.

#### Styles
This folder contains files that affect aesthetics and theme of the system mainly focus on Stylix and base16 colors.
It also contains information about gaps, borders... for Hyprland, Waybar and so on.

#### Profiles
This folder contains files that affect SW that is install, default apps and configuration of models.

### Modules and roles
Modules and roles are split to 2 folders - home and system.
Home handles home manager related definitions. System handles system services and programs.

#### Modules
Every module has lib.mkIf option which refers to profile, where that module can be either enabled or disabled and some can be further modified.
Some features require both system-level and Home Manager configuration. For example, Hyprland is configured through programs.hyprland in the system configuration and wayland.windowManager.hyprland in Home Manager.

### Roles
Roles are defined in host.nix in list roles.system or roles.home. Roles are collection of SW, packages, basic utils... that doesn't need any specific user based settings, but can be hw specific (e. g. asus-rog role).


# Adding a new workstation

To add a new workstation you need to follow these steps:

1. download and extract this repo somewhere to your system (I have it personally in my ~/ folder)
2. Go to hosts, create new folder with a whatever name your want for your workstation
3. Go to that folder and run this command to generate hardware-configuration.nix:

``` zsh
sudo nixos-generate-config --dir .
```
4. Copy "hosts/Example/host.nix" file and paste it to your newly created host folder and change the definition by your HW and user specific needs. The host folder name **needs** to corresponde with hostname definition.
5. Run this command:

``` zsh
sudo nixos-rebuild switch --flake ~/nixos-config#PC1
```

**! Important !**
Change ~/nixos-config to a path, whereever is this repo, and #PC1 to a name that **MATCH** a name that you declare in host.nix.

6. Your system will take some time to download all of the SW and data. After that you will have your system done without rebooting.