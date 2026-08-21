{
  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/126E69456E692329";
    fsType = "ntfs3";
    options = [ "ro" "nofail" ];
  };

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/7B4B1250249FC622";
    fsType = "ntfs3";
    options = [ "rw" "uid=1000" "gid=100" "nofail" ];
  };

  fileSystems."/mnt/hdd" = {
    device = "/dev/disk/by-uuid/01DB56EFADFE53A0";
    fsType = "ntfs3";
    options = [ "rw" "uid=1000" "gid=100" "nofail" ];
  };
}
