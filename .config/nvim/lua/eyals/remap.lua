-- define the leader key
vim.g.mapleader = ' '
--
-- Open the file exploerer more esilyt than :Ex
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
vim.keymap.set('n', '<C-n>', vim.cmd.Ex)

-- *** Clipboard Clipboard ***
--
-- This maps the system OS to use the special + register when copy and pasting using the reguarl p and y commands
vim.o.clipboard = 'unnamedplus'

-- This will map the <leander>p to paste from the 0 register that still has what we yanked. This
-- Helps when pasting over somthing that was selected while we still have something in the clipboard 
-- continue pasting. We simply continue pasting using <leader>p
vim.keymap.set('n', '<leader>p', '"0p')
-- End  *** Clipboad handling ***

-- jump easily to the start and the end of the line using H and L
-- remap the current shortcuts to be used with leader key
--
vim.keymap.set('n', '<leader>H', 'H')
vim.keymap.set('v', '<leader>H', 'H')
vim.keymap.set('n', '<leader>L', 'L')
vim.keymap.set('v', '<leader>L', 'L')

vim.keymap.set('n', 'H', '^')
vim.keymap.set('v', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('v', 'L', '$')

-- when using x to delete chars do not place these deleted chars under the pasing register
vim.keymap.set('n', 'x', '"_x')

-- Simulate hitting the gas when moving vetically by pressing shift on j and k will jump 10 lines of code.
vim.keymap.set('n', 'J', '10j')
vim.keymap.set('n', 'K', '10k')
vim.keymap.set('v', 'J', '10j')
vim.keymap.set('v', 'K', '10k')

-- short cut to replay the script in register a once
vim.keymap.set('n', '<leader>s', '1@a')

-- Just to the last place I was editing using undo and redo trick
vim.keymap.set('n', '<leader>u', '`.' )

