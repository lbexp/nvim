-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Nvim package manager
    use {
        'wbthomason/packer.nvim'
    }

    -- Tooling package manager
    use {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    }

    -- Editor theme
    use {
        'craftzdog/solarized-osaka.nvim',
        config = function()
            vim.cmd.colorscheme 'solarized-osaka'
        end
    }

    -- Visualize indentation line
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup()
        end
    }

    -- Track coding activity
    use {
        'wakatime/vim-wakatime'
    }

    -- Built-in git
    use {
        'tpope/vim-fugitive'
    }

    -- Find/grep mechanism
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Undo/redo mechanism
    use {
        'mbbill/undotree'
    }

    -- File switching shortcuts
    use {
        'theprimeagen/harpoon'
    }

    -- Language parser
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- LSP shenanigans
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x' 
    }
    use {
        'neovim/nvim-lspconfig'
    }
    use {
        'hrsh7th/nvim-cmp'
    }
    use {
        'hrsh7th/cmp-nvim-lsp'
    }

    -- Formatter
    use {
        "stevearc/conform.nvim"
    }

    -- Comment/uncomment mechanism
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            })
        end
    }
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
            require('ts_context_commentstring').setup()
        end
    }

    -- Auto create char pair
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end
    }

    -- Wrap blocks with brackets/ticks
    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup()
        end
    }
end)
