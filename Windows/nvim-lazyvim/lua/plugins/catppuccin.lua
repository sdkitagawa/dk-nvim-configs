return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      -- Ensure true color
      vim.opt.termguicolors = true
      -- Catppuccin setup
      require("catppuccin").setup({
        flavour = "mocha", -- Change to latte/frappe/macchiato if you prefer
        transparent_background = true,
        term_colors = true,
        integrations = {
          lualine = true,
          telescope = true,
          treesitter = true,
        },
      })
      -- Apply colorscheme
      vim.cmd("colorscheme catppuccin")
    end,
  },
}
