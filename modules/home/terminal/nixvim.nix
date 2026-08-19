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
            shiftwidth = 0;
            softtabstop = -1;
            expandtab = true;

            # automatic formatting
            smartindent = true;
            smartcase = true;

            # minimal number of screen lines to keep above and below the cursor
            scrolloff = 999;

            wrap = false;
            clipboard = "unnamedplus";

            # highlight the screen line of the cursor
            cursorline = true;
            # save undo information in a file
            undofile = true;

            # better normal mode cursor
            # guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20;
        };

        globals = {
            mapleader = " ";
            maplocalleader = " ";
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

            # TUI git integration
            lazygit.enable = true;

            # TUI menu
            which-key = {
                enable = true;

                settings = {
                    plugins.presets = {
                        operators = false;
                        motions = false;
                        text_objects = false;
                        windows = false;
                        nav = false;
                        z = false;
                        g = false;
                    };

                    spec = [
                    {
                        __unkeyed-1 = "<leader>f";
                        group = "Find";
                    }
                    {
                        __unkeyed-1 = "<leader>g";
                        group = "Git";
                    }
                    {
                        __unkeyed-1 = "<leader>o";
                        group = "Oil";
                    }
                    {
                        __unkeyed-1 = "<leader>t";
                        group = "Terminal";
                    }
                    {
                        __unkeyed-1 = "<leader>c";
                        group = "Code";
                    }
                    ];
                };
            };

            # file explorer
            oil = {
                enable = true;

                settings = {
                    default_file_explorer = true;

                    view_options.show_hidden = true;
                };
            };

            # set ESC to "jk"
            better-escape = {
                enable = true;
                settings = {
                    mapping = [ "j" "k" ];
                    timeout = 150;
                };
            };

            treesitter = {
                enable = true;
            };

            telescope.enable = true;
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

            # Open Oil at current file
            {
                mode = "n";
                key = "-";
                action = "<cmd>Oil %:h<CR>";
            }
            {
                mode = "n";
                key = "<leader>oo";
                action = "<cmd>Oil<CR>";
            }

            # telescope
            {
                mode = "n";
                key = "<leader>ff";
                action = "<cmd>Telescope find_files<CR>";
            }
            {
                mode = "n";
                key = "<leader>fg";
                action = "<cmd>Telescope live_grep<CR>";
            }
            {
                mode = "n";
                key = "<leader>fb";
                action = "<cmd>Telescope buffers<CR>";
            }

            # lazygit
            {
                mode = "n";
                key = "<leader>gg";
                action = "<cmd>LazyGit<CR>";
            }

        ];

    };

}
