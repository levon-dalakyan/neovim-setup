return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            local alpha = require "alpha"
            local dashboard = require "alpha.themes.dashboard"

            dashboard.section.header.val = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
            }

            alpha.setup(dashboard.config)
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "html-lsp",
                "css-lsp",
                "prettier",
                "sql-formatter",
                "eslint-lsp",
                "gopls",
                "sqls",
                "js-debug-adapter",
                "typescript-language-server",
                "clangd",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "typescript",
                "javascript",
                "go",
                "json",
                "sql",
                "http",
                "proto",
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        config = function()
            require "configs.lint"
        end,
        opts = {
            linters = {
                eslint_d = {
                    args = {
                        "--no-warn-ignored",
                    },
                },
            },
        },
    },
    {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    never_show = {},
                    hide_by_name = {},
                    always_show = {
                        ".env",
                        ".env.local",
                    },
                },
                follo_current_file = true,
                use_libuv_file_watcher = true,
            },
        },
    },
    {
        "ggandor/leap.nvim",
        lazy = false,
        config = function()
            require("leap").add_default_mappings(true)
        end,
    },
    {
        "folke/trouble.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "Exafunction/codeium.vim",
        enabled = false,
        lazy = false,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
    { "NvChad/colorify", enabled = false },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter", -- load on entering insert mode
        dependencies = {
            "hrsh7th/cmp-buffer", -- buffer completions
            "hrsh7th/cmp-path", -- path completions
            "hrsh7th/cmp-nvim-lsp", -- LSP completions
            "saadparwaiz1/cmp_luasnip", -- snippet completions (optional)
            "L3MON4D3/LuaSnip", -- snippet engine (optional)
            "kristijanhusak/vim-dadbod-completion", -- dadbod completion source
        },
    },
    {
        "tpope/vim-dadbod",
        lazy = false,
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            "tpope/vim-dadbod",
            "kristijanhusak/vim-dadbod-completion",
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        ft = { "sql", "mysql", "plsql" },
    },
    {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        dependencies = "tpope/vim-dadbod",
        config = function() end,
    },
    {
        "rest-nvim/rest.nvim",
        ft = { "http" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                opts.ensure_installed = opts.ensure_installed or {}
                table.insert(opts.ensure_installed, "http")
            end,
        },
    },
    {
        "hudclark/grpc-nvim",
        ft = { "grpc" },
        requires = { "nvim-lua/plenary.nvim" },
    },
    {
        "uarun/vim-protobuf", -- Syntax highlighting for .proto
        ft = "proto",
    },
    {
        "sphamba/smear-cursor.nvim",
        lazy = false,
        opts = {
            -- Smear cursor when switching buffers or windows.
            smear_between_buffers = true,
            smear_between_neighbor_lines = true,
            scroll_buffer_space = true,
            legacy_computing_symbols_support = false,

            -- Faster smear
            smear_insert_mode = true,
            stiffness = 0.8, -- 0.6      [0, 1]
            trailing_stiffness = 0.5, -- 0.4      [0, 1]
            stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
            trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
            damping = 0.8, -- 0.65     [0, 1]
            damping_insert_mode = 0.8, -- 0.7      [0, 1]
            distance_stop_animating = 0.5, -- 0.1      > 0
            time_interval = 10, -- milliseconds
        },
    },
    {
        "karb94/neoscroll.nvim",
        lazy = false,
        opts = {
            duration_multiplier = 0.5,
        },
    },
    {
        "echasnovski/mini.surround",
        lazy = false,
        version = "*",
        opts = {
            mappings = {
                add = "zn",
                delete = "",
                find = "",
                find_left = "",
                highlight = "",
                replace = "",
                update_n_lines = "",
                suffix_last = "",
                suffix_next = "",
            },
        },
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "leoluz/nvim-dap-go",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
        },
        config = function()
            local dap = require "dap"
            local ui = require "dapui"

            require("dapui").setup()
            require("dap-go").setup()

            -- Handled by nvim-dap-go
            -- dap.adapters.go = {
            --   type = "server",
            --   port = "${port}",
            --   executable = {
            --     command = "dlv",
            --     args = { "dap", "-l", "127.0.0.1:${port}" },
            --   },
            -- }

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end,
    },
    {
        "olexsmir/gopher.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
        },
        config = function()
            require("gopher").setup()
        end,
        ft = "go",
    },
    {
        "MagicDuck/grug-far.nvim",
        lazy = false,
        config = function()
            require("grug-far").setup {}
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {
            modes = {
                char = {
                    jump_labels = true,
                },
            },
        },
        -- stylua: ignore
        keys = {
          { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
          { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
}
