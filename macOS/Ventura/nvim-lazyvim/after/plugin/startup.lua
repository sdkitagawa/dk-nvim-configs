-- ~/.config/nvim/after/plugin/startup.lua
-- Set a fixed global startup directory and optionally open Neo-tree

local startup_dir = "/Users/dkitagawa/Documents/DK's Coding Workspace"

-- ensure the directory exists before changing to it
if vim.fn.isdirectory(startup_dir) == 1 then
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- set global working directory
      vim.api.nvim_set_current_dir(startup_dir)

      -- optionally open Neo-tree at that directory if installed
      local ok, neo = pcall(require, "neo-tree.command")
      if ok and neo then
        neo.execute({ toggle = true, dir = startup_dir })
      end
    end,
  })
else
  vim.notify("Startup directory not found: " .. startup_dir, vim.log.levels.WARN)
end
