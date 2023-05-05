return {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                              , branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup{
            defaults = {
                winblend = 65, -- Set the transparency of the Telescope window
                pumblend = 0, -- Set the transparency of the pum
                blend = 0, -- Set the transparency of the Telescope window
            }
        }
    end
}
