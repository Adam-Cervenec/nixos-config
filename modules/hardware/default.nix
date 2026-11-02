{ myHost, ... }:

{
    imports =
        (if (myHost.hardware.gpu.nvidia or false) then [ ./nvidia.nix ] else [ ])
        ++ (if (myHost.hardware.bluetooth or false) then [ ./bluetooth.nix ] else [ ]);
}
