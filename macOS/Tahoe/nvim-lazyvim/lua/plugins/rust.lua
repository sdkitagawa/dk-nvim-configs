-- ~/.config/nvim/lua/plugins/rust.lua
-- C:/Users/user_name/AppData/Local/nvim/lua/plugins/rust.lua
-- Rust Compiler Location on macOS
local env = require("env").load_env("/Users/dkitagawa/.config/nvim/.env")

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
                                    RUSTC = env.RUST_COMPILER_MACOS,
                                },
                            },
                        },
                    },
                },
            },
        },
    },
}
