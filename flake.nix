{
  description = "My NixOS dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:

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
          inherit cfg;
        };

        modules = [

          ./hosts/${hostName}/hardware-configuration.nix
          #./hosts/${hostName}/configuration.nix

          ./modules/system/default.nix
        ]
        ++ map (r: ./roles/system/${r}.nix) cfg.roles.system
        ++
        [

          home-manager.nixosModules.home-manager

          {

            networking.hostName = cfg.machine.hostname;

            home-manager = {

              useGlobalPkgs = true;
              useUserPackages = true;
              home.stateVersion = cfg.machine.homeVersion;

              extraSpecialArgs = {
                inherit cfg;
              };

              users.${cfg.machine.username} = {
                imports = [
                  #./hosts/${hostName}/home.nix
                  ./modules/home/default.nix
                ]
                ++ map (r: ./roles/home/${r}.nix) cfg.roles.home;
              };
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