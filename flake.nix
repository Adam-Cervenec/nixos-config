#flake.nix

{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:

    let
      lib = nixpkgs.lib;

      mkHost = host:
        let
          device = import ./hosts/${host}/device.nix;
        in
        lib.nixosSystem {
          system = device.machine.system;

          specialArgs = {
            inherit inputs device;
          };

          modules =
            [
              ./hosts/${host}/configuration.nix

              home-manager.nixosModules.home-manager

              {
                home-manager.users.${device.machine.username} =
                  import ./hosts/${host}/home.nix;

                home-manager.useUserPackages = true;

                home-manager.extraSpecialArgs = {
                  inherit inputs device;
                };
                home-manager.sharedModules =
                  lib.optional (device.modules.stylix.enable or false)
                    inputs.stylix.homeModules.stylix;
              }
            ]
            ++ lib.optional (device.modules.stylix.enable or false) stylix.nixosModules.stylix;
        };
    in
    {
      nixosConfigurations = {
        MainDesktop = mkHost "MainDesktop";
        Asus-A16 = mkHost "Asus-A16";
      };
    };
}