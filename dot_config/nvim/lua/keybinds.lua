local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

-- The function is called `t` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient

-- The function is called `t` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient
vim.g.mapleader = ' '

wk.register({
    f = {
        name = "file", -- optional group name
        o = { "<cmd>lua require'fzf-lua'.files({ cmd = 'fd --type f --exclude node_modules' })<cr>", "Find File" }, -- create a binding with label
    },
}, { prefix = "<leader>" })
