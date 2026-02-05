-- ~/.config/nvim/after/plugin/run_cpp.lua
-- Compile and run current C++ file. Creates :RunCPP and <leader>rc.

local function find_compiler()
  if vim.fn.executable("g++") == 1 then
    return "g++"
  end
  if vim.fn.executable("clang++") == 1 then
    return "clang++"
  end
  return nil
end

local function run_in_terminal(cmd)
  -- Try toggleterm if available
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

local function run_current_cpp()
  local fname = vim.fn.expand("%:p")
  if fname == "" then
    vim.notify("No file to run", vim.log.levels.WARN)
    return
  end

  -- Ensure filetype is C++ or extension looks like C++
  local ft = vim.bo.filetype
  local ext = vim.fn.expand("%:e")
  local is_cpp = ft == "cpp"
    or ft == "c++"
    or ext == "cpp"
    or ext == "cc"
    or ext == "cxx"
    or ext == "hpp"
    or ext == "hh"
    or ext == "h"
  if not is_cpp then
    vim.notify("Current buffer is not detected as C++", vim.log.levels.WARN)
    -- Still allow running if user insists; comment out return to allow
    -- return
  end

  -- Save buffer if modified
  if vim.bo.modified then
    vim.cmd("write")
  end

  local compiler = find_compiler()
  if not compiler then
    vim.notify("No C++ compiler found (g++ or clang++)", vim.log.levels.ERROR)
    return
  end

  -- Create a temp binary name in system temp dir
  local tmpdir = vim.fn.getenv("TMPDIR") or "/tmp"
  local base = vim.fn.fnamemodify(fname, ":t:r")
  local bin = tmpdir .. "/" .. base .. "_" .. tostring(vim.fn.getpid())

  -- Compile flags: enable C++17, show warnings, include debug symbols
  local flags = "-std=c++17 -O2 -Wall -Wextra -g"
  local compile_cmd =
    string.format("%s %s %s -o %s", compiler, flags, vim.fn.shellescape(fname), vim.fn.shellescape(bin))

  -- Compile and run in a single shell command so we see compile errors then run if success
  local shell_cmd = compile_cmd .. " && " .. vim.fn.shellescape(bin)
  run_in_terminal(shell_cmd)
end

-- Command and mapping
vim.api.nvim_create_user_command("RunCPP", function()
  run_current_cpp()
end, { desc = "Compile and run current C++ file" })
vim.keymap.set("n", "<leader>rc", run_current_cpp, { desc = "Compile and run current C++ file" })
