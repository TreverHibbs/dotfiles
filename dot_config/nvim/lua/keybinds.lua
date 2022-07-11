local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
	f = {
		name = "file", -- optional group name
		o = { "<cmd>FzfLua files<cr>", "Find File" }, -- create a binding with label
	},
}, { prefix = "<leader>" })
