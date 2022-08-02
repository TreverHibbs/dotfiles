local coq = require "coq"
local runtime_path = vim.split(package.path, ';')
local lspconfig = require("lspconfig")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- util functions
local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

-- lsp settings
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local format_exclude_set = {}

local common_on_attach = function(client, bufnr)
    if not has_value(format_exclude_set, client.name) then
        Keybinds.format_on_attach(client, bufnr)
    end
    Keybinds.common_on_attach(client, bufnr)
end

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        lspconfig[server_name].setup(coq.lsp_ensure_capabilities({
            on_attach = common_on_attach,
        }))
    end,
    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["html"] = function()
    --     lspconfig["html"].setup(coq.lsp_ensure_capabilities({
    --         on_attach = no_format_on_attach,
    --     }))
    -- end,
    -- ["jsonls"] = function()
    --     lspconfig["jsonls"].setup(coq.lsp_ensure_capabilities({
    --         on_attach = no_format_on_attach,
    --     }))
    -- end,
})
