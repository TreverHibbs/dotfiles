local coq = require "coq"

require('nvim-lsp-setup').setup(coq.lsp_ensure_capabilities({
    servers = {
        sumneko_lua = {},
        html = {},
        tsserver = {}
    }
}))
