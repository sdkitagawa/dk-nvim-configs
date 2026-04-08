-- ~/.config/nvim/lua/plugins/stay-centered
-- C:/Users/user_name/AppData/Local/nvim/lua/plugins/stay-centered.lua
-- Rust Compiler Location on Windows
local env = require("env").load_env("C:/Users/Douglas Kitagawa/AppData/Local/nvim/.env")

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                extraEnv = {
                                    RUSTC = env.RUST_COMPILER_WINDOWS,
                                },
                            },
                        },
                    },
                },
            },
        },
    },
}
