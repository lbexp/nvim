-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'maxmx03/solarized.nvim',
        config = function()
            vim.o.background = 'dark'
            ---@type solarized
            local solarized = require('solarized')
            vim.o.termguicolors = true
            vim.o.background = 'dark'
            solarized.setup({})
            vim.cmd.colorscheme 'solarized'
        end
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use({ 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' })
    use({ 'neovim/nvim-lspconfig' })
    use({ 'hrsh7th/nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lsp' })

    use 'wakatime/vim-wakatime'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    }

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    css = { "prettier" },
                    html = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                },
                format_on_save = {
                    -- These options will be passed to conform.format()
                    timeout_ms = 1000,
                    lsp_format = "fallback",
                },
            })
        end,
    })

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup()
        end
    }
end)
