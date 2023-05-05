return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({
            extra_groups = { "NvimTreeNormal", "FloatBorder" },
        })
    vim.g.tokyonight_transparent = vim.g.transparent_enabled
    end,
}
