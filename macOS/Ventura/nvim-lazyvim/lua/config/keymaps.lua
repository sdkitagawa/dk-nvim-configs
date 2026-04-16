-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Terminal = require("toggleterm.terminal").Terminal
local vterm = Terminal:new({ direction = "vertical" })

vim.keymap.set("n", "<leader>h", function()
    require("toggleterm.terminal").Terminal:new({ direction = "horizontal" }):toggle()
end, { desc = "Open Horizontal Terminal" })

vim.keymap.set("n", "<leader>v", function()
    vterm:toggle()
end, { desc = "Vertical Terminal", remap = false })
