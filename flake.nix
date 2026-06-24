{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #stylix for automatic themes
    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }:
  {
    nixosConfigurations = {
      MainDesktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/MainDesktop/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.users.user = import ./hosts/MainDesktop/home.nix;
          }

          #activation of stylix
          stylix.nixosModules.stylix
        ];
      };
      Asus-A16 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/Asus-A16/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.users.user = import ./hosts/Asus-A16/home.nix;
          }
        ];
      };
    };
  };
}
