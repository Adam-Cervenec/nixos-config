{ cfg, ... }:

{
    imports = if (cfg.hardware.gpu.nvidia or false) then [ ./nvidia.nix ] else [ ];
}
