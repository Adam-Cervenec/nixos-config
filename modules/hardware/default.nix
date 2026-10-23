{ cfg, ... }:

{
    imports =
        (if (cfg.hardware.gpu.nvidia or false) then [ ./nvidia.nix ] else [ ])
        ++ (if (cfg.hardware.bluetooth or false) then [ ./bluetooth.nix ] else [ ]);
}
