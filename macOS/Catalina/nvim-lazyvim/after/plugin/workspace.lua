-- ~/.config/nvim/after/plugin/workspace.lua
local workspace_dir = vim.fn.expand("/Users/dkitagawa/Documents/DK's Coding Workspace")

local function cd_to_workspace()
  if vim.fn.isdirectory(workspace_dir) == 1 then
    -- set global working directory without opening any buffer
    vim.api.nvim_set_current_dir(workspace_dir)
    vim.notify("cwd set to: " .. workspace_dir, vim.log.levels.INFO)
  else
    vim.notify("Workspace directory not found: " .. workspace_dir, vim.log.levels.WARN)
  end
end

-- Create a simple user command: :Workspace
vim.api.nvim_create_user_command("Workspace", function()
  cd_to_workspace()
end, { nargs = 0 })

-- Optional mapping: <leader>dw to jump to workspace dir (change leader if needed)
vim.keymap.set("n", "<leader>dw", cd_to_workspace, { desc = "cd to DK's Coding Workspace" })
