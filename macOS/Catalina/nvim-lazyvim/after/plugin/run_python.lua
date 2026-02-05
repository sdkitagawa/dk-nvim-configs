-- ~/.config/nvim/after/plugin/run_python.lua
-- Run current buffer with Python. Creates :RunPython and <leader>rp.

local function find_local_python()
  -- procura por .venv/bin/python ou venv/bin/python no cwd ou em ancestrais
  local cwd = vim.fn.getcwd()
  local candidates = {
    cwd .. "/.venv/bin/python",
    cwd .. "/venv/bin/python",
    cwd .. "/.venv/Scripts/python.exe", -- Windows style if ever used
    cwd .. "/venv/Scripts/python.exe",
  }

  -- também verifica em diretório do arquivo atual
  local filedir = vim.fn.expand("%:p:h")
  if filedir ~= "" and filedir ~= cwd then
    table.insert(candidates, 1, filedir .. "/.venv/bin/python")
    table.insert(candidates, 1, filedir .. "/venv/bin/python")
  end

  for _, p in ipairs(candidates) do
    if vim.fn.executable(p) == 1 then
      return p
    end
  end

  -- fallback para python do PATH (prefere python3 se disponível)
  if vim.fn.executable("python3") == 1 then
    return "python3"
  end
  if vim.fn.executable("python") == 1 then
    return "python"
  end
  return nil
end

local function run_in_terminal(cmd)
  -- tenta usar toggleterm se disponível
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

  -- fallback: split horizontal terminal
  vim.cmd("belowright split")
  vim.cmd("resize 12")
  local term_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, term_buf)
  vim.fn.termopen(cmd, { pty = true })
  vim.cmd("startinsert")
end

local function run_current_python()
  local fname = vim.fn.expand("%:p")
  if fname == "" then
    vim.notify("Nenhum arquivo para executar", vim.log.levels.WARN)
    return
  end

  -- salva buffer se modificado
  if vim.bo.modified then
    vim.cmd("write")
  end

  -- detecta python local ou global
  local python = find_local_python()
  if not python then
    vim.notify("Python não encontrado no PATH e nenhum .venv/venv detectado", vim.log.levels.ERROR)
    return
  end

  local escaped = vim.fn.shellescape(fname)
  -- -u para saída não bufferizada, útil para ver prints em tempo real
  local cmd = python .. " -u " .. escaped

  run_in_terminal(cmd)
end

-- Comando e mapeamento
vim.api.nvim_create_user_command("RunPython", function()
  run_current_python()
end, { desc = "Run current file with Python" })
vim.keymap.set("n", "<leader>rp", run_current_python, { desc = "Run current file with Python" })
