-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use "EdenEast/nightfox.nvim"
    use 'tanvirtin/monokai.nvim'
    use { 'ms-jpq/coq_nvim', branch = 'coq' }
    use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup({ sources = {
                require("null-ls").builtins.formatting.prettier,
            },
            })
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })
end)
