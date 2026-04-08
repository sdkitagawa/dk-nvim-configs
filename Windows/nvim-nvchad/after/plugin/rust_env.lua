-- ~/.config/nvim/after/plugin/rust_env.lua
-- C:/Users/user_name/AppData/Local/nvim/after/plugin/rust_env.lua

local env_path = vim.fn.stdpath("config") .. "/.env"
local env = require("env").load_env(env_path)

local workspace_dir = env.RUST_WINDOWS_WORKSPACE or vim.fn.expand(".")

local function cd_to_workspace()
  if vim.fn.isdirectory(workspace_dir) == 1 then
    vim.api.nvim_set_current_dir(workspace_dir)
    vim.notify("cwd set to: " .. workspace_dir, vim.log.levels.INFO)
  else
    vim.notify("Workspace directory not found: " .. workspace_dir, vim.log.levels.WARN)
  end
end

vim.api.nvim_create_user_command("RsEnv", cd_to_workspace, {})
vim.keymap.set("n", "<leader>dw", cd_to_workspace, { desc = "Change directory to Rust workspace" })