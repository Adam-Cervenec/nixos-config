{
  description = "My NixOS dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs = { nixpkgs, home-manager, stylix, ... }@inputs:

  let
    lib = nixpkgs.lib;

    hosts =
      lib.filter
        (host:
          builtins.pathExists ./hosts/${host}/host.nix &&
          builtins.pathExists ./hosts/${host}/hardware-configuration.nix)
        (builtins.attrNames (builtins.readDir ./hosts));

    mkHost = hostName:

      let
        host = import ./hosts/${hostName}/host.nix;

        cfg =
          lib.foldl'
            lib.recursiveUpdate
            {}
            ((map import host.settings) ++ [ host ]);

      in

      lib.nixosSystem {

        system = cfg.machine.system;

        specialArgs = {
          inherit cfg inputs;
        };

        modules = [

          ./hosts/${hostName}/hardware-configuration.nix
          #./hosts/${hostName}/configuration.nix

          ./modules/system/default.nix

          stylix.nixosModules.stylix
        ]
        ++ lib.optional
          (builtins.pathExists ./hosts/${hostName}/disks.nix)
          ./hosts/${hostName}/disks.nix
        ++ map (r: ./roles/system/${r}.nix) cfg.roles.system
        ++
        [

          home-manager.nixosModules.home-manager

          {

            networking.hostName = cfg.machine.hostname;

            home-manager = {

              useUserPackages = true;

              extraSpecialArgs = {
                inherit cfg inputs;
              };

              users.${cfg.machine.username} = {
                home.stateVersion = cfg.machine.homeVersion;
                imports = [
                  #./hosts/${hostName}/home.nix
                  ./modules/home/default.nix
                ]
                ++ map (r: ./roles/home/${r}.nix) cfg.roles.home;

                nixpkgs = {
                  config.allowUnfree = cfg.machine.unfreePkgs;
                };
              };

              sharedModules = [
                stylix.homeModules.stylix
              ];
            };
          }
        ];
      };

  in
  {

    nixosConfigurations =
      lib.genAttrs hosts mkHost;

  };
}