local wk = require("which-key")
local coq = require "coq"
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")


require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua" },
})

require 'lspconfig'.sumneko_lua.setup(coq.lsp_ensure_capabilities({
    on_attach = Keybinds.on_attach,
}))
require 'lspconfig'.html.setup(coq.lsp_ensure_capabilities({
    on_attach = Keybinds.on_attach,
}))

-- require('nvim-lsp-setup').setup(coq.lsp_ensure_capabilities({
--     servers = {
--         sumneko_lua = {
--             Lua = {
--                 diagnostics = {
--                     -- Get the language server to recognize the `vim` global
--                     globals = { 'vim' },
--                 },
--                 runtime = {
--                     ['special'] = {
--                         ["include"] = "require"
--                     },
--                     path = runtime_path,
--                 },
--                 workspace = {
--                     -- Make the server aware of Neovim runtime files
--                     library = {
--                         vim.fn.expand('$VIMRUNTIME/lua'),
--                         vim.fn.stdpath('config') .. '/lua'
--                     }
--                 },
--             }
--         },
--         html = {},
--         tsserver = {},
--         jsonls = {}
--     }
-- }))
