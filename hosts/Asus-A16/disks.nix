{
    fileSystems."/data" = {
        device = "/dev/disk/by-uuid/126E69456E692329";
        fsType = "ntfs3";
        options = [
            "nofail"
            "uid=1000"
            "gid=100"
            "umask=0022"
        ];
    };
}
