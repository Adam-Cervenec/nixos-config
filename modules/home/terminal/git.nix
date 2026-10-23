{ cfg, ... }:

#define variable cfg for path
let
    cfgGit = cfg.profile.git or { };
in

{

    programs.git = {
        enable = true;

        settings = {
            user.name = cfgGit.username;
            user.email = cfgGit.email;
        };
    };

}
