{
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix


    # modules
    ../../modules/roles/nvidia.nix
  ];
}