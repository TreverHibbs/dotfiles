local wk = require("which-key")
local coq = require "coq"
local runtime_path = vim.split(package.path, ';')
local lspconfig = require("lspconfig")
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

-- these next three statments are for setting default formatter to null-ls
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
    Keybinds.on_attach(client, bufnr)
end

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        lspconfig[server_name].setup(coq.lsp_ensure_capabilities({
            on_attach = on_attach,
        }))
    end,
    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `sumneko_lua`:
    -- ["sumneko_lua"] = function()
    --     lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities({
    --         on_attach = Keybinds.on_attach,
    --         settings = {
    --             Lua = {
    --                 format = {
    --                     enable = true,
    --                     -- Put format options here
    --                     -- NOTE: the value should be STRING!!
    --                     --
    --                     -- Does not work because neovim over rides this setting
    --                     defaultConfig = {
    --                         indent_style = "space",
    --                         indent_size = "2",
    --                     }
    --                 }
    --             }
    --         }
    --     }))
    -- end,
})
