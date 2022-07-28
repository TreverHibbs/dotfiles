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

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup(coq.lsp_ensure_capabilities({
            on_attach = Keybinds.on_attach,
        }))
    end
    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["rust_analyzer"] = function()
    --     require("rust-tools").setup {}
    -- end
}

--require 'lspconfig'.sumneko_lua.setup(coq.lsp_ensure_capabilities({
--}))
--require 'lspconfig'.html.setup(coq.lsp_ensure_capabilities({
--    on_attach = Keybinds.on_attach,
--}))
