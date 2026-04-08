-- ~/.config/nvim/after/plugin/startup.lua
-- C:/Users/user_name/AppData/Local/nvim/after/plugin/startup.lua
-- Set a fixed global startup directory and optionally open Neo-tree

local env_path = vim.fn.stdpath("config") .. "/.env"
local env = require("env").load_env(env_path)

local sys = vim.loop.os_uname().sysname

local startup_dir =
    (sys == "Windows_NT" and env.PERSONAL_WINDOWS_WORKSPACE)
    or (sys == "Darwin" and env.PERSONAL_MACOS_WORKSPACE)
    or env.PERSONAL_LINUX_WORKSPACE

if not (startup_dir and vim.fn.isdirectory(startup_dir) == 1) then
    return
end

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.api.nvim_set_current_dir(startup_dir)

        local ok, neo = pcall(require, "neo-tree.command")
        if ok and neo then
            neo.execute({ toggle = true, dir = startup_dir })
        end
    end,
})
