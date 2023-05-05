return{
	'numToStr/Comment.nvim', lazy = false,
	keys = {
		{
			mode = "n",
			"<C-_>",
			function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
			desc = "Comment line nino huh test",
		},
		{
			mode = "v",
			"<C-_>",
			"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
			desc = "Comment line nino huh test",
		}
	}
}
