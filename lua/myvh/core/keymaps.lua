-----------------------------------------------------------
--			Neovim Keybinds
-----------------------------------------------------------
vim.g.mapleader	= " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-----------------------------------------------------------
--			Telescope Keybinds
-----------------------------------------------------------
local keymap = vim.keymap

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]


-----------------------------------------------------------
--			 UndooTree Keybinds
-----------------------------------------------------------
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)


-----------------------------------------------------------
--			 Fugitive Keybinds
-----------------------------------------------------------
keymap.set("n", "<leader>gs", vim.cmd.Git)

-----------------------------------------------------------
--			 42 header Keybinds
-----------------------------------------------------------
keymap.set("n", "<leader>42 ", "<cmd>Header42<cr>")

-----------------------------------------------------------
--			 bear Keybinds
-----------------------------------------------------------

keymap.set("n", "<leader>42c", "<cmd>!cjson<cr>")
keymap.set("n", "<leader>42cpp", "<cmd>!c++json<cr>")
