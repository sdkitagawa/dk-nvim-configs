-- ~/.config/nvim/after/plugin/config_cd.lua
local config_dir = vim.fn.expand("~/.config/nvim")

local function cd_to_config()
  if vim.fn.isdirectory(config_dir) == 1 then
    -- set global working directory without opening any buffer
    vim.api.nvim_set_current_dir(config_dir)
    vim.notify("cwd set to: " .. config_dir, vim.log.levels.INFO)
  else
    vim.notify("Config directory not found: " .. config_dir, vim.log.levels.WARN)
  end
end

-- Create a simple user command: :Config
vim.api.nvim_create_user_command("Config", function()
  cd_to_config()
end, { nargs = 0 })

-- Optional mapping: <leader>cd to jump to config dir (change leader if needed)
vim.keymap.set("n", "<leader>cd", cd_to_config, { desc = "cd to ~/.config/nvim" })
