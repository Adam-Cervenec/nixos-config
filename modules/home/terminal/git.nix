{ myHost, ... }:

#define variable myHost for path
let
    cfg = myHost.profile.git or { };
in

{

    programs.git = {
        enable = true;

        settings = {
            user.name = cfg.username;
            user.email = cfg.email;
        };
    };

}
