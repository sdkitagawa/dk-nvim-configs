-- ~/.config/nvim/after/plugin/run_lua.lua
-- Run current buffer with Lua. Creates :RunLua and <leader>rl.

local function find_lua_interpreter()
  if vim.fn.executable("luajit") == 1 then
    return "luajit"
  end
  if vim.fn.executable("lua") == 1 then
    return "lua"
  end
  return nil
end

local function run_in_terminal(cmd)
  local ok, toggleterm = pcall(require, "toggleterm.terminal")
  if ok and toggleterm and toggleterm.Terminal then
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

  -- Fallback: horizontal split terminal
  vim.cmd("belowright split")
  vim.cmd("resize 12")
  local term_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, term_buf)
  vim.fn.termopen(cmd, { pty = true })
  vim.cmd("startinsert")
end

local function run_current_lua()
  local fname = vim.fn.expand("%:p")
  if fname == "" then
    vim.notify("No file to run", vim.log.levels.WARN)
    return
  end

  -- Ensure filetype is lua or extension is lua
  local ft = vim.bo.filetype
  local ext = vim.fn.expand("%:e")
  if ft ~= "lua" and ext ~= "lua" then
    vim.notify("Current buffer is not detected as Lua", vim.log.levels.WARN)
  end

  -- Save buffer if modified
  if vim.bo.modified then
    vim.cmd("write")
  end

  local interp = find_lua_interpreter()
  if not interp then
    vim.notify("No Lua interpreter found (lua or luajit)", vim.log.levels.ERROR)
    return
  end

  local escaped = vim.fn.shellescape(fname)
  local cmd = interp .. " " .. escaped

  run_in_terminal(cmd)
end

vim.api.nvim_create_user_command("RunLua", function()
  run_current_lua()
end, { desc = "Run current file with Lua" })
vim.keymap.set("n", "<leader>rl", run_current_lua, { desc = "Run current file with Lua" })
