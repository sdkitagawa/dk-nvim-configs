return {
	-- Tokyo Night Moon - Main theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			-- Sets the Default theme
			vim.cmd("colorscheme tokyonight-moon")
		end,
	},

	-- Catppuccin - Alternative
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				term_colors = true,
				integrations = {
					lualine = true,
					telescope = true,
					treesitter = true,
				},
			})
		end,
	},

	-- Other themes (lazy loaded)
	{ "navarasu/onedark.nvim", lazy = true },
	{ "Mofiqul/vscode.nvim", lazy = true },
	{ "kepano/flexoki", lazy = true },
	{ "decaycs/decay.nvim", lazy = true },
	{
		"akinsho/horizon.nvim",
		lazy = true,
		config = function()
			require("horizon").setup({
				transparent_background = true,
			})
		end,
	},
	{ "xiantang/darcula-dark.nvim", lazy = true },
	{ "Shatur/neovim-ayu", lazy = true },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = true },
	{ "tiagovla/tokyodark.nvim", lazy = true },
	{
		"maxmx03/fluoromachine.nvim",
		lazy = true,
		config = function()
			require("fluoromachine").setup({
				glow = true,
				theme = "fluoromachine",
				transparent = true,
			})
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "shaunsingh/nord.nvim", lazy = true },
	{ "Mofiqul/dracula.nvim", lazy = true },
	{ "sainnhe/everforest", lazy = true },
	{ "olimorris/onedarkpro.nvim", lazy = true },
}
