{
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix


    # modules
    ../../modules/common/hardware/roles/nvidia.nix
  ];
}