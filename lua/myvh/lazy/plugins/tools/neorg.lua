return {
	"nvim-neorg/neorg", lazy = false,
	-- lazy-load on filetype
	ft = "norg",
	-- options for neorg. This will automatically call `require("neorg").setup(opts)`
	opts = {
		load = {
			["core.defaults"] = {},
		}
	}
}
