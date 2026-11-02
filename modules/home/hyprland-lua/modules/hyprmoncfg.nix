{
    wayland.windowManager.hyprland = {

        extraLuaFiles = {
            "hyprmoncfg" = {
                content = ''
                    do
                        local path = (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config")
                            .. "/hypr/hyprmoncfg-monitors.lua"

                        local file = io.open(path, "r")
                        if file then
                            file:close()
                            dofile(path)
                        end
                    end
                '';
                autoLoad = true;
            };
        };
    };
}
