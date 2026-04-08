-- ~/.config/nvim/lua/plugins/nvim-surround.lua
-- C:/Users/user_name/AppData/Local/nvim/lua/plugins/nvim-surround.lua
-- Nvim Surround Setup
return {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Leave empty to use defaults or add your options here
        })
    end,
}
