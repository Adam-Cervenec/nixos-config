{
    pkgs,
    cfg,
    inputs,
    ...
}:

{
    home.packages = [
        (pkgs.wrapFirefox
            inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped
            {
                extraPolicies = {
                    DisableTelemetry = true;
                    DisablePocket = true;
                };
            }
        )
    ];
}
