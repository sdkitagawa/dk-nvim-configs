return {
    "akinsho/toggleterm.nvim",
    opts = {
        size = function(term)
        if term.direction == "vertical" then
            return vim.o.columns * 0.5   -- 50% of the window width
        elseif term.direction == "horizontal" then
            return vim.o.lines * 0.3     -- optional: 30% height
        end
        end,
    },
}
