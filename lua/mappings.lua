require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

vim.api.nvim_set_keymap("n", "<C-w><C-h>", ":resize +5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-w><C-;>", ":resize -5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-w><C-.>", ":vertical resize +15<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-w><C-,>", ":vertical resize -15<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<S-left>", "<S-Tab>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<S-right>", "<Tab>", { noremap = false, silent = true })

-- NvChad copied mappings
map("i", "jk", "<ESC>")

map("n", "<leader>cx", function()
    require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })

map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Todo" })
map("n", "\\", "<cmd>:vsplit <CR>", { desc = "Vertical Split" })
map("n", "<c-l>", "<cmd>:TmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<c-k>", "<cmd>:TmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<c-j>", "<cmd>:TmuxNavigateDown<cr>", { desc = "Tmux Down" })

-- Trouble

map("n", "<leader>qx", "<cmd>TroubleToggle<CR>", { desc = "Open Trouble" })
map("n", "<leader>qw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Open Workspace Trouble" })
map("n", "<leader>qd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Open Document Trouble" })
map("n", "<leader>qq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Open Quickfix" })
map("n", "<leader>ql", "<cmd>TroubleToggle loclist<CR>", { desc = "Open Location List" })
map("n", "<leader>qt", "<cmd>TodoTrouble<CR>", { desc = "Open Todo Trouble" })

-- Tests
map("n", "<leader>tt", function()
    require("neotest").run.run()
end, { desc = "Run nearest test" })
map("n", "<leader>tf", function()
    require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run file test" })
map("n", "<leader>to", ":Neotest output<CR>", { desc = "Show test output" })
map("n", "<leader>ts", ":Neotest summary<CR>", { desc = "Show test summary" })

-- Git
map("n", "<leader>gl", ":Flog<CR>", { desc = "Git Log" })
map("n", "<leader>gf", ":DiffviewFileHistory<CR>", { desc = "Git File History" })
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Git Last Commit" })
map("n", "<leader>gt", ":DiffviewToggleFile<CR>", { desc = "Git File History" })

-- Terminal
map("n", "<C-]>", function()
    require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Toogle Terminal Vertical" })
map("n", "<C-\\>", function()
    require("nvchad.term").toggle { pos = "sp", size = 0.4 }
end, { desc = "Toogle Terminal Horizontal" })
map("n", "<C-f>", function()
    require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })
map("t", "<C-]>", function()
    require("nvchad.term").toggle { pos = "vsp" }
end, { desc = "Toogle Terminal Vertical" })
map("t", "<C-\\>", function()
    require("nvchad.term").toggle { pos = "sp" }
end, { desc = "Toogle Terminal Horizontal" })
map("t", "<C-f>", function()
    require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })

-- Codeium
map("i", "<C-g>", function()
    return vim.fn["codeium#Accept"]()
end, { expr = true })

local cmp = require "cmp"
cmp.setup {
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Using LuaSnip
        end,
    },
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
    },
    sources = cmp.config.sources {
        { name = "vim-dadbod-completion" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
}

-- Rest
vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "Run HTTP request" })
-- GRPC
vim.keymap.set("n", "<leader>gg", "<cmd>Grpc<cr>", { desc = "Run GRPC request" })

-- Dap
local dap = require "dap"
local dapui = require "dapui"

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dgb", dap.run_to_cursor, { desc = "DAP: Run to Cursor" })

vim.keymap.set("n", "<leader>d?", function()
    dapui.eval(nil, { enter = true })
end, { desc = "DAP: Eval under Cursor" })

vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
vim.keymap.set("n", "<F2>", dap.step_into, { desc = "DAP: Step Into" })
vim.keymap.set("n", "<F3>", dap.step_over, { desc = "DAP: Step Over" })
vim.keymap.set("n", "<F4>", dap.step_out, { desc = "DAP: Step Out" })
vim.keymap.set("n", "<F5>", dap.step_back, { desc = "DAP: Step Back" })
vim.keymap.set("n", "<F6>", dap.restart, { desc = "DAP: Restart" })

-- Gopher
vim.keymap.set("n", "gtc", "<cmd>:GoTagClear<cr>", { desc = "GoTagClear" })
vim.keymap.set("n", "gtj", "<cmd>:GoTagAdd json<cr>", { desc = "GoTagAdd json" })
vim.keymap.set("n", "gty", "<cmd>:GoTagAdd yaml<cr>", { desc = "GoTagAdd yaml" })
vim.keymap.set("n", "gtd", "<cmd>:GoTagAdd db<cr>", { desc = "GoTagAdd db" })
vim.keymap.set("n", "gie", "<cmd>:GoIfErr<cr>", { desc = "Go If Err" })
vim.keymap.set("n", "gta", "<cmd>:GoTestsAll<cr>", { desc = "Go Tests All" })
vim.keymap.set("n", "gto", "<cmd>:GoTestAdd<cr>", { desc = "Go Test Add" })

-- Grug
vim.keymap.set("n", "<leader>gf", "<cmd>:GrugFar<cr>", { desc = "GrugFar" })

-- Markdown
vim.keymap.set("n", "<leader>rmt", "<cmd>:RenderMarkdown toggle<cr>", { desc = "RenderMarkdown toggle" })
