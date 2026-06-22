{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
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
