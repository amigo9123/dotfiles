-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope for fuzzy search
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Kanagawa colorscheme (not currently used)
    use({
        'rebelot/kanagawa.nvim',
        as = 'kanagawa',
        config = function()
            require('kanagawa').setup({
                background = {
                    dark = 'dragon'
                }
            })
        end
    })

    -- Gruvbox colorscheme
    use({
        'morhetz/gruvbox',
        as = 'gruvbox',
        config = function()
            vim.cmd("let g:gruvbox_contrast_dark = 'hard'")
            vim.cmd("colorscheme gruvbox")
        end
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use 'nvim-treesitter/playground'

    use 'mbbill/undotree'

    use 'tpope/vim-fugitive'

    use 'theprimeagen/harpoon'

    -- use 'dense-analysis/ale'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })
end)
