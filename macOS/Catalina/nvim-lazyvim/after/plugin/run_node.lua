-- ~/.config/nvim/after/plugin/run_node.lua
-- Run the current buffer with node. Creates :RunNode and <leader>rn.
local function run_node_in_terminal(cmd)
  -- prefer toggleterm if available
  local ok, toggleterm = pcall(require, "toggleterm.terminal")
  if ok and toggleterm and toggleterm.Terminal then
    -- use a floating terminal if toggleterm is installed
    local Terminal = toggleterm.Terminal
    local t = Terminal:new({
      cmd = cmd,
      hidden = true,
      direction = "float",
      close_on_exit = false,
    })
    t:toggle()
    return
  end

  -- fallback: open a horizontal split terminal
  vim.cmd("belowright split")
  vim.cmd("resize 12")
  local term_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, term_buf)
  local shell = vim.o.shell
  local job_opts = { pty = true }
  vim.fn.termopen(cmd, job_opts)
  vim.cmd("startinsert")
end

local function run_current_file()
  local fname = vim.fn.expand("%:p")
  if fname == "" then
    vim.notify("No file to run", vim.log.levels.WARN)
    return
  end

  -- save buffer if modified
  if vim.bo.modified then
    vim.cmd("write")
  end

  -- escape path for shell
  local escaped = vim.fn.shellescape(fname)
  local cmd = "node " .. escaped

  run_node_in_terminal(cmd)
end

-- User command :RunNode
vim.api.nvim_create_user_command("RunNode", function()
  run_current_file()
end, { desc = "Run current file with node" })

-- Mapping <leader>rn
vim.keymap.set("n", "<leader>rn", run_current_file, { desc = "Run current file with node" })
