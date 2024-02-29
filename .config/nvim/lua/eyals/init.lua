require("eyals.remap")
require("eyals.packer")

-- when pressing tab insert 2 apaces
vim.opt.tabstop = 2
-- when indenting add 2 spaces for the indentation
vim.opt.shiftwidth = 2
-- make pressing tab insert 2 spaces instead of the tab char
vim.o.expandtab = 2
-- Disable word wrapping
vim.wo.wrap = false
-- show the line numbers gutter/ruller
vim.wo.number = true
-- show relative line numbering on the line-numbers ruller
vim.wo.relativenumber = true
-- be case insensitive when searching
vim.o.ignorecase = true

-- Lua
-- vim.cmd[[colorscheme darkplus]]

-- For dark theme (neovim's default)
vim.o.background = 'dark'
-- For light theme
-- vim.o.background = 'light'

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
require('vscode').load()
