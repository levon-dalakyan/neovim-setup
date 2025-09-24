vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.g.translate_source = "ru"
vim.g.translate_target = "en"
vim.g.NERDTreeShowHidden = 1

vim.opt.rtp:prepend(lazypath)

vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.filetype.add {
    extension = {
        http = "http",
        grpc = "grpc",
    },
}

vim.o.foldenable = true
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99 -- very high number to open all folds

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
        config = function()
            require "options"
        end,
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

vim.api.nvim_set_hl(0, "Search", { bg = "#4e88ff", fg = "#ffffff" }) -- blue background, white text
vim.api.nvim_set_hl(0, "IncSearch", { bg = "#ff7e00", fg = "#ffffff", bold = true }) -- vibrant orange
vim.api.nvim_set_hl(0, "CurSearch", { bg = "#ff7e00", fg = "#ffffff", bold = true }) -- vibrant orange

require "nvchad.autocmds"

vim.schedule(function()
    require "mappings"
end)

-- Re-apply comment color every 100ms for the first 5 seconds
local timer = vim.loop.new_timer()
local count = 0

timer:start(
    100,
    100,
    vim.schedule_wrap(function()
        vim.api.nvim_set_hl(0, "Comment", { fg = "#999999" })
        vim.api.nvim_set_hl(0, "@comment", { fg = "#999999" })
        count = count + 1
        if count > 50 then
            timer:stop()
            timer:close()
            print "Stopped auto-overwrite for Comment highlight"
        end
    end)
)

-- Customize visual mode selection highlight
vim.api.nvim_set_hl(0, "Visual", { bg = "#3e3e4f" })

-- Border around vim.lsp.buf.hover()
vim.o.winborder = "single" -- or 'single', 'double', 'solid'

-- Set color for line numbers (absolute)
vim.api.nvim_set_hl(0, "LineNr", { fg = "#656565" }) -- Green text color for line numbers

-- Set color of separators between windows
vim.cmd [[highlight WinSeparator guifg=#555555 guibg=NONE]]
