{
    config,
    ...
}:

{
    programs.firefox = {
        enable = true;
        configPath = "${config.xdg.configHome}/firefox";

        policies = {
            DisableTelemetry = true;
            DisablePocket = true;

            SearchEngines = {
                Default = "DuckDuckGo";
            };
        };
    };
}
