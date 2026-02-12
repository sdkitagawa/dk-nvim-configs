return {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    config = function()
        -- Ensure scrolloff is nonzero so scrollEOF has something to mimic
        vim.o.scrolloff = 8

        -- Explicit setup call so we know the plugin is initialized
        require("scrollEOF").setup({
            pattern = "*",
            insert_mode = false,
            floating = true,
            disabled_filetypes = { "terminal" },
            disabled_modes = { "t", "nt" },
        })
    end,
}
