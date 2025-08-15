require("lazy").setup({
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
		end,
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup()
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = { theme = "auto" },
			})
		end,
	},

	{
		"MunifTanjim/prettier.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("prettier").setup({
				bin = "prettier",
				filetypes = {
					"css",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"json",
					"markdown",
					"html",
					"lua",
				},
			})
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"javascript",
					"typescript",
					"html",
					"css",
					"json",
					"python"
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				  ensure_installed = { "html", "jdtls", "jsonls", "ltex", "powershell_es", "pyright", "zls", "gopls"},
				  automatic_installation = true
			})
			require("lspconfig").pyright.setup({})
		end,
	},
	{ 
		"catppuccin/nvim", 
		name = "catppuccin", 
		priority = 1000 
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",  -- Lazy-load on insert mode
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",      -- LSP completion source
			"hrsh7th/cmp-buffer",        -- Buffer source
			"hrsh7th/cmp-path",          -- Path completion
			"hrsh7th/cmp-cmdline",       -- Cmdline completion
			"L3MON4D3/LuaSnip",          -- Snippets engine
			"saadparwaiz1/cmp_luasnip",  -- Snippet completion source
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
})
