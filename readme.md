### Adding a new workstation

To add a new workstation you need to follow these steps:

1. download and extract this repo somewhere to your system (I have it personally in my ~/ folder)
2. Go to hosts, create new folder with a whatever name your want for your workstation
3. Go to that folder and run this command to generate configuration.nix and hardware-configuration.nix:

``` zsh
sudo nixos-generate-config --dir .
```
4. You can add home.nix file for home-manager
5. go to flake.nix and in nixosConfigurations add another workstation declaration (copy same existing ones), declare name of your workstation and update paths in flake.nix to point to your new host directory and generated files
6. now you can copy template file configuration.nix and home.nix from another workstation and change the setting or even create new from scratch and import modules to configuration.nix in your workstation folder or import home-modules to home.nix
7. Change networking.hostName in configuration.nix in your host folder that **MATCH** the name (nixosConfigurations.<name>) you declare in flake.nix
8. now paste this command, that will build your first generation of NixOS from this workstation:

``` zsh
sudo nixos-rebuild switch --flake ~/nixos-config#PC1
```

**! Important !**
Change ~/nixos-config to a path, whereever is this repo, and #PC1 to a name that **MATCH** a name that you declare in flake.nix

9. Your system will take some time to download all of the SW that you declare in home.nix and configuration.nix. After that you will have your system done without rebooting.
10. Change/add/delete modules from home-modules and modules to definition in your host files
11. If you imported home-modules/zsh.nix module in your home.nix file, you can rebuild this system again simply by typing:

``` zsh
rebuild
```
And there are more aliasis that I declared in zsh.nix in home-modules, f.e.:

``` zsh
rebuild
boot
test
update
upgrade
rollback
clean
```

12. I highly recommend to put your nixos-config to your github repo