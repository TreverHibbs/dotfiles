--- Defines all keybindins with which key plugin.
--
-- @module Keybindings
-- @author RampantPorcupine_

local wk = require("which-key")
local neogen = require('neogen')
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
local bufopts_common = { noremap = true, silent = true }
local bufopts_visual = { unpack(bufopts_common), mode = "v" }

Keybinds = {}
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
Keybinds.common_on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { unpack(bufopts_common), buffer = bufnr }
    wk.register({
        ["<leader>"] = {
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
            D = { function()
                vim.lsp.buf.type_definition()
            end, "Type Definition" },
            rn = { function()
                vim.lsp.buf.rename()
            end, "Rename" },
            ca = { function()
                vim.lsp.buf.code_action()
            end, "Code Action" },
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

Keybinds.format_on_attach = function(client, bufnr)
    local bufopts = { unpack(bufopts_common), buffer = bufnr }
    wk.register({
        ["<leader>"] = {
            f = {
                f = { function()
                    vim.lsp.buf.formatting()
                end, "Format" },
            },
        }
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
        s = { "<cmd>set invspell<cr>", "Spell" }, -- create a binding with label
        p = { "<cmd>FzfLua commands<cr>", "Command Pallet" },
        h = { "<cmd>FzfLua help_tags<cr>", "Help Tags" },
        ["n"] = {
            name = "+neogen",
            m = { function()
                neogen.generate({ type = 'func' })
            end, "function" },
            c = { function()
                neogen.generate({ type = 'class' })
            end, "class" },
            t = { function()
                neogen.generate({ type = 'type' })
            end, "type" },
            f = { function()
                neogen.generate({ type = 'file' })
            end, "file" },
            l = { function()
                neogen.jump_next()
            end, "jump next" },
            h = { function()
                neogen.jump_prev()
            end, "jump prev" },
        },
    },
    ["["] = {
        d = { function() vim.diagnostic.goto_prev() end, "Previous Diagnostic" }
    },
    ["]"] = {
        d = { function()
            vim.diagnostic.goto_next()
        end, "Next Diagnostic" }
    },
    ["g"] = {
        q = { "format lines" },
    },
}, bufopts_common)

wk.register({
    ["g"] = {
        q = { "format lines" },
    },
}, bufopts_visual)
