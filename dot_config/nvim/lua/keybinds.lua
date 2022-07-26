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

Keybinds = {}
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
Keybinds.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    wk.register({
        ["<leader>"] = {
            f = {
                f = { function()
                    vim.lsp.buf.formatting()
                end, "Format" },
            },
            w = {
                r = { function()
                    vim.lsp.buf.remove_workspace_folder()
                end, "Remove Workspace Folder" },
                a = { function()
                    vim.lsp.buf.add_workspace_folder()
                end, "Add Workspace Folder" },
                l = { function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, "List Workspace Folders" },
            },
            D = {function ()
                         vim.lsp.buf.type_definition()
                 end, "Type Definition"},
            rn = {function ()
                         vim.lsp.buf.rename()
                 end, "Rename"},
            ca = {function ()
                         vim.lsp.buf.code_action()
                 end, "Code Action"},
        },
        ["g"] = {
            name = "Goto",
            D = { function()
                vim.lsp.buf.declaration()
            end, "Goto Declaration"
            },
            d = { function()
                vim.lsp.buf.definition()
            end, "Goto Definition"
            },
            r = { function()
                vim.lsp.buf.references()
            end, "References"
            },
        },
        K = { function()
            vim.lsp.buf.hover()
        end, "Lsp Hover" },
    }, bufopts)
end

wk.register({
    ["<leader>"] = {
        f = {
            name = "file", -- optional group name
            o = { "<cmd>lua require'fzf-lua'.files({ cmd = 'fd --type f --exclude node_modules' })<cr>", "Find File" }, -- create a binding with label
        },
        e = { function() vim.diagnostic.open_float() end, "Open Diagnostics Float Window" },
        q = { function() vim.diagnostic.setloclist() end, "Set Local List" },
    },
    ["["] = {
        d = { function() vim.diagnostic.goto_prev() end, "Previous Diagnostic" }
    },
    ["]"] = {
        d = { function()
            vim.diagnostic.goto_next()
        end, "Next Diagnostic" }
    },
})
