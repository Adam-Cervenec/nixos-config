{ cfg, lib, ...}:

let
cfgNixvim = cfg.profile.nixvim or {};
in

lib.mkIf (cfgNixvim.enable or false) {
    programs.nixvim = {
        enable = true;
        opts = {
            
            # print the line number in front of each line 
            number = true;

            # show relative line number in front of each line
            relativenumber = true;

            # <TAB> settings
            tabstop = 4;
            shiftwidth = 4;
            softtabstop = 4;
            expandtab = true;

            # automatic formatting
            smartindent = true;
            smartcase = true;

            # minimal number of screen lines to keep above and below the cursor
            scrolloff = 8;

            wrap = false;
            clipboard = "unnamedplus";

            # highlight the screen line of the cursor
            cursorline = true;
            # save undo information in a file
            undofile = true;

            # better normal mode cursor
            guicursor = "n-v-c:ver35,i-ci-ve:ver25,r-cr:hor20";
        };

        lsp = {
            #enable = true;
            servers = {
                clangd.enable = true; # C/C++
                    pyright.enable = true; # Python
                    rust_analyzer.enable = true; # Rust
                    bashls.enable = true; # Bash
                    nixd.enable = true; # Nix
                    html.enable = true; # HTML
                    cssls.enable = true; # CSS
                    jsonls.enable = true; # JSON
                    arduino_language_server.enable = true; # Arduino C
            };
        };

        plugins = {
            # completion plugin with LSP 
            blink-cmp.enable = true;
            # git commit status plugin
            gitsigns.enable = true;
            # file explorer
            oil = {
                enable = true;

                settings = {
                    default_file_explorer = true;

                    view_options.show_hidden = true;
                };
            };
        };

        keymaps = [
            # remap redo to U
            {
                mode = "n";
                key = "U";
                action = "<C-r>";
            }
            # remap noh to Esc
            {
                mode = "n";
                key = "<Esc>";
                action = "<cmd>nohlsearch<CR>";
            }
        ];
    };

}
