local coq = require "coq"
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require('nvim-lsp-setup').setup(coq.lsp_ensure_capabilities({
    servers = {
        sumneko_lua = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                runtime = {
                    ['special'] = {
                        ["include"] = "require"
                    },
                    path = runtime_path,
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                        vim.fn.expand('$VIMRUNTIME/lua'),
                        vim.fn.stdpath('config') .. '/lua'
                    }
                },
            }
        },
        html = {},
        tsserver = {},
        jsonls = {}
    }
}))
