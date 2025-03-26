-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
local map = vim.keymap.set
map({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
map(  'n',        'gp', '"+p', { desc = 'Paste from system clipboard' })
map(  'n',        'gP', '"+P', { desc = 'Paste from system clipboard' })
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
map(  'x',        'gp', '"+P', { desc = 'Paste from system clipboard' })
