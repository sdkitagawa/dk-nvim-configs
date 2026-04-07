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
                  RUSTC = "C:\\Users\\Douglas Kitagawa\\.cargo\\bin\\rustc.exe",
                },
              },
            },
          },
        },
      },
    },
  },
}
