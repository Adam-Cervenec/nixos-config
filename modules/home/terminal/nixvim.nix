{
    cfg,
    lib,
    pkgs,
    ...
}:

let
    cfgNixvim = cfg.profile.nixvim or { };
in

lib.mkIf (cfgNixvim.enable or false) {

    # dependencies
    home.packages = with pkgs; [
        nixfmt
        clang-tools
        gdb
        rustfmt
        ruff
        stylua
        shfmt
        prettier
    ];

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

        # wraping paragraphs in .md files
        autoCmd = [
            {
                event = [ "FileType" ];
                pattern = [ "markdown" ];
                command = "setlocal wrap linebreak";
            }
        ];

        globals = {
            mapleader = " ";
            maplocalleader = " ";
        };
        lsp = {
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
            gitsigns.settings = {
                signs = {
                    add = {
                        text = "█";
                    };
                    change = {
                        text = "█";
                    };
                    delete = {
                        text = "█";
                    };
                    topdelete = {
                        text = "█";
                    };
                    changedelete = {
                        text = "█";
                    };
                    untracked = {
                        text = "█";
                    };
                };

                signcolumn = true;
                numhl = true;
                linehl = false;
            };

            lspconfig.enable = true;

            # debugger
            dap = {
                enable = true;

                adapters.executables.gdb = {
                    command = "gdb";
                    args = [ "--interpreter=dap" ];
                };

                configurations.c = [
                    {
                        name = "Launch C program";
                        type = "gdb";
                        request = "launch";

                        program.__raw = ''
                            function()
                              return vim.fn.input(
                                "Executable: ",
                                vim.fn.getcwd() .. "/",
                                "file"
                              )
                            end
                        '';

                        cwd = "\${workspaceFolder}";
                        stopAtBeginningOfMainSubprogram = false;
                    }
                ];
            };

            dap-ui.enable = true;
            dap-virtual-text.enable = true;

            # TUI git integration
            lazygit.enable = true;

            # TUI menu
            which-key = {
                enable = true;

                settings.triggers = [
                    {
                        __unkeyed-1 = "<leader>";
                        mode = [
                            "n"
                            "v"
                        ];
                    }
                ];

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
                            __unkeyed-1 = "<leader>c";
                            group = "Code";
                        }
                        {
                            __unkeyed-1 = "<leader>m";
                            group = "Markdown";
                        }
                        {
                            __unkeyed-1 = "<leader>n";
                            group = "Notes (Obsidian)";
                        }
                        {
                            __unkeyed-1 = "<leader>t";
                            group = "Terminal";
                        }
                        {
                            __unkeyed-1 = "<leader>d";
                            group = "Debugger";
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

                    win_options = {
                        signcolumn = "yes:2";
                    };
                };
            };

            # git status for oil
            oil-git-status.enable = true;

            # set ESC to "jk"
            better-escape = {
                enable = true;
                settings = {
                    mapping = [
                        "j"
                        "k"
                    ];
                    timeout = 150;
                };
            };

            treesitter = {
                enable = true;
            };

            telescope.enable = true;

            # automatic {}, [], <>, () pairs
            nvim-autopairs.enable = true;

            # error, warnings etc...
            trouble.enable = true;

            # comment lines
            comment.enable = true;

            # visual block vertical lines
            indent-blankline.enable = true;

            # animated vertical lines for current block
            mini-indentscope = {
                enable = true;

                settings = {
                    symbol = "│";

                    options = {
                        try_as_border = true;
                    };
                };
            };

            # automatic formatter
            conform-nvim = {
                enable = true;

                settings = {
                    formatters.nixfmt = {
                        command = "nixfmt";
                        args = [
                            "--indent"
                            "4"
                        ];
                    };
                    formatters_by_ft = {
                        nix = [ "nixfmt" ];
                        c = [ "clang_format" ];
                        cpp = [ "clang_format" ];
                        rust = [ "rustfmt" ];
                        python = [ "ruff_format" ];
                        lua = [ "stylua" ];
                        bash = [ "shfmt" ];
                        json = [ "prettier" ];
                        html = [ "prettier" ];
                        css = [ "prettier" ];
                        markdown = [ "prettier" ];
                    };

                    format_on_save = {
                        timeout_ms = 500;
                        lsp_format = "fallback";
                    };
                };
            };

            # Terminal
            toggleterm = {
                enable = true;

                settings = {
                    direction = "horizontal";
                    size = 8;
                    open_mapping = "[[<c-\\>]]";
                    insert_mappings = true;
                    terminal_mappings = true;
                };
            };

            # Markdown rendering directly inside Neovim
            render-markdown = {
                enable = true;

                settings = {
                    preset = "obsidian";
                };
            };

            # Markdown preview in browser
            markdown-preview = {
                enable = true;
            };

            # obsidian = {
            #     enable = true;
            #
            #     settings = {
            #
            #         legacy_commands = false;
            #
            #         workspaces = [
            #             {
            #                 name = "personal";
            #                 path = "/mnt/hdd/Projekty/Obsidian/Trezor T/";
            #             }
            #         ];
            #
            #         picker = {
            #             name = "telescope.nvim";
            #         };
            #     };
            #
            # };
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
                action = "<cmd>LazyGitCurrentFile<CR>";
                options.desc = "Lazygit";
            }

            # MD preview toggle
            {
                mode = "n";
                key = "<leader>mp";
                action = "<cmd>MarkdownPreviewToggle<CR>";
                options.desc = "Markdown Preview";
            }

            # MD render toggle
            {
                mode = "n";
                key = "<leader>mr";
                action = "<cmd>RenderMarkdown toggle<CR>";
                options.desc = "Toggle Markdown Rendering";
            }

            # Obsidian
            {
                mode = "n";
                key = "<leader>nf";
                action = "<cmd>Obsidian quick_switch<CR>";
                options.desc = "Find note";
            }
            {
                mode = "n";
                key = "<leader>ns";
                action = "<cmd>Obsidian search<CR>";
                options.desc = "Search notes";
            }
            {
                mode = "n";
                key = "<leader>nn";
                action = "<cmd>Obsidian new<CR>";
                options.desc = "New note";
            }
            {
                mode = "n";
                key = "<leader>nb";
                action = "<cmd>Obsidian backlinks<CR>";
                options.desc = "Backlinks";
            }

            # terminal
            {
                mode = "n";
                key = "<leader>tt";
                action = "<cmd>ToggleTerm<CR>";
                options.desc = "Toggle terminal";
            }

            # trouble
            {
                mode = "n";
                key = "<leader>cd";
                action = "<cmd>Trouble diagnostics toggle<CR>";
                options.desc = "Diagnostics";
            }
            {
                mode = "n";
                key = "<leader>cs";
                action = "<cmd>Trouble symbols toggle<CR>";
                options.desc = "Symbols";
            }

            # Debugger
            {
                mode = "n";
                key = "<leader>db";
                action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
                options.desc = "Toggle breakpoint";
            }
            {
                mode = "n";
                key = "<leader>dc";
                action = "<cmd>lua require('dap').continue()<CR>";
                options.desc = "Start / continue debugging";
            }
            {
                mode = "n";
                key = "<leader>dn";
                action = "<cmd>lua require('dap').step_over()<CR>";
                options.desc = "Step over";
            }
            {
                mode = "n";
                key = "<leader>di";
                action = "<cmd>lua require('dap').step_into()<CR>";
                options.desc = "Step into";
            }
            {
                mode = "n";
                key = "<leader>do";
                action = "<cmd>lua require('dap').step_out()<CR>";
                options.desc = "Step out";
            }
            {
                mode = "n";
                key = "<leader>du";
                action = "<cmd>lua require('dapui').toggle()<CR>";
                options.desc = "Toggle debugger UI";
            }
            {
                mode = "n";
                key = "<leader>dx";
                action = "<cmd>lua require('dap').terminate()<CR>";
                options.desc = "Stop debugging";
            }
        ];

    };

}
