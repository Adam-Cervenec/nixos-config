#flake.nix

{
  description = "My NixOS config";

  # External flake dependencies
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

      # Detect valid host in ./host dir by checking for required configuration files
      isHost = host:
        builtins.pathExists ./hosts/${host}/device.nix &&
        builtins.pathExists ./hosts/${host}/hardware-configuration.nix &&
        builtins.pathExists ./hosts/${host}/configuration.nix;

      # List of detected hosts
      hosts =
        lib.filter
          isHost
          (builtins.attrNames (builtins.readDir ./hosts));

      #function that declare host flake with settings set in device.nix in their host folders
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
              # sets path to system config
              ./hosts/${host}/configuration.nix

              home-manager.nixosModules.home-manager

              {
                # sets path to home config
                home-manager.users.${device.machine.username} =
                  import ./hosts/${host}/home.nix;

                home-manager.useUserPackages = true;

                home-manager.extraSpecialArgs = {
                  inherit inputs device;
                };

                # Import Stylix home scope if enabled in device.nix
                home-manager.sharedModules =
                  lib.optional (device.modules.stylix.enable or false)
                    inputs.stylix.homeModules.stylix;
              }
            ]

            # Import Stylix system scope if enabled in device.nix
            ++ lib.optional (device.modules.stylix.enable or false) stylix.nixosModules.stylix;
        };
    in
    {
      nixosConfigurations = lib.genAttrs hosts mkHost;
    };
}