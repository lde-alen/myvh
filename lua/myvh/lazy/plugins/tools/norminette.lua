return{
    "hardyrafael17/norminette42.nvim",
    config = function()
    require("norminette").setup{
        runOnSave = true,         -- Optional, Defaults to trueh, check for errors after save
        maxErrorsToShow = 5,  -- Only show 5 errors
    }
    end,
}

