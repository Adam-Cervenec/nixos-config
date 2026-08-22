{
    config,
    pkgs,
    cfg,
    ...
}:

let
    cfgUsername = cfg.machine.username or { };
in
{
    # 1. Povolení Dockeru a skupiny pro uživatele
    virtualisation.docker.enable = true;
    users.users.adam.extraGroups = [
        "docker"
        "dialout"
    ];

    # 2. Vytvoření adresářové struktury v /srv/smart-home
    systemd.tmpfiles.rules = [
        "d /srv/smart-home/mosquitto/config 0755 root root -"
        "d /srv/smart-home/mosquitto/data 0755 root root -"
        "d /srv/smart-home/mosquitto/log 0755 root root -"
        "d /srv/smart-home/zigbee2mqtt/data 0755 root root -"
        "d /srv/smart-home/home-assistant/config 0755 root root -"
        "f /srv/smart-home/mosquitto/config/mosquitto.conf 0644 root root - listener 1883\\nallow_anonymous true\\n"
    ];

    # 3. Definice kontejnerů
    virtualisation.oci-containers.backend = "docker";
    virtualisation.oci-containers.containers = {
        mosquitto = {
            image = "eclipse-mosquitto:2";
            ports = [ "1883:1883" ];
            volumes = [
                "/srv/smart-home/mosquitto/config:/mosquitto/config"
                "/srv/smart-home/mosquitto/data:/mosquitto/data"
                "/srv/smart-home/mosquitto/log:/mosquitto/log"
            ];
        };

        zigbee2mqtt = {
            image = "koenkk/zigbee2mqtt:latest";
            ports = [ "8080:8080" ];
            volumes = [ "/srv/smart-home/zigbee2mqtt/data:/app/data" ];
            extraOptions = [
                "--privileged"
                "--device=/dev/serial/by-id/usb-SONOFF_SONOFF_Dongle_Max_MG24_f2009035f5a0f0118f952e81bb936ffa-if00-port0:/dev/ttyUSB0"
            ];
            dependsOn = [ "mosquitto" ];
        };

        homeassistant = {
            image = "ghcr.io/home-assistant/home-assistant:stable";
            ports = [ "8123:8123" ];
            volumes = [
                "/srv/smart-home/home-assistant/config:/config"
                "/etc/localtime:/etc/localtime:ro"
            ];
            dependsOn = [ "mosquitto" ];
        };
    };
}
