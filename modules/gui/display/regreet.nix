{ config, pkgs, lib, ... }:

{
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.cage}/bin/cage ${
          pkgs.regreet
        }/bin/regreet";

        user = "greeter";
      };
    };
  };
}