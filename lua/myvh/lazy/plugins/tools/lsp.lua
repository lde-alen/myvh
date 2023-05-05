return{
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	dependencies = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{                                      -- Optional
			'williamboman/mason.nvim',
			build = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	},
	config = function()
		local lsp = require("lsp-zero")
		lsp.preset("recommended")
		lsp.ensure_installed({
			"intelephense",
		})
		lsp.nvim_workspace()

		local cmp = require("cmp")
		lsp.defaults.cmp_mappings({
			["<C-p>"] = cmp.mapping.select_prev_item({
				behavior = cmp.SelectBehavior.Select,
			}),
			["<C-n>"] = cmp.mapping.select_next_item({
				behavior = cmp.SelectBehavior.Select,
			}),
			["<C-y>"] = cmp.mapping.confirm({
				select = true,
			}),
			["<C-Space>"] = cmp.mapping.complete(),
		})

		lsp.set_preferences({
			suggest_lsp_servers = false,
			sign_icons = {
				error = "E",
				warn = "W",
				hint = "H",
				info = "I",
			},
		})

		lsp.on_attach(function(_, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>vh", vim.lsp.buf.signature_help, opts)
		end)

		lsp.setup()

		vim.diagnostic.config({
			update_in_insert = false,
			virtual_text = true,
		})
	end,
}

