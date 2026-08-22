{
    config,
    cfg,
    pkgs,
    lib,
    ...
}:
let
    cfgSsh = cfg.profile.ssh or { };
    cfgUsername = cfg.machine.username;
    port = cfgSsh.port or 22;

    rawKeys = cfgSsh.keys or [ ];

    # support for either string or path
    # e.g.:
    # profile.ssh.keys = [
    #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI... uzivatel@pc" #  string
    #   ./keys/id_ed25519.pub                               # path
    # ];
    # note: add only ssh-keygen files, others may not work due to formating
    processKey = key: if lib.isPath key then lib.strings.trim (builtins.readFile key) else key;

    formattedKeys = map processKey rawKeys;
in
lib.mkIf (cfgSsh.enable or false) {
    # set ssh
    services.openssh = {
        enable = true;
        ports = [ port ];
        settings = {
            PasswordAuthentication = false;
            PermitRootLogin = "no";
        };
    };

    # definition of users and public ssh key
    users.users.${cfgUsername} = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];

        openssh.authorizedKeys.keys = formattedKeys;
    };

    # allow firewall port
    networking.firewall.allowedTCPPorts = [ port ];
}
