-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'github/copilot.vim'
    use 'ThePrimeagen/vim-be-good'
    use 'wbthomason/packer.nvim'
    use	{
	    'nvim-telescope/telescope.nvim', tag = '0.1.6',
	    -- or                            , branch = '0.1.x',
	    requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-treesitter/playground'
    use 'nvim-lua/plenary.nvim' -- don't forget to add this one if you don't have it yet!
    use	{
	    'ThePrimeagen/harpoon', branch = 'harpoon2',
	    requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {   'neovim/nvim-lspconfig' },
            {   'williamboman/mason.nvim'  },
            {   'williamboman/mason-lspconfig.nvim'    },

            -- Autocompletion
            {   'hrsh7th/nvim-cmp'  },
            {   'hrsh7th/cmp-buffer'    },
            {   'hrsh7th/cmp-path'  },
            {   'saadparwaiz1/cmp_luasnip'  },
            {   'hrsh7th/cmp-nvim-lsp'  },
            {   'hrsh7th/cmp-nvim-lua'  },

            -- Snippets
            {   'L3MON4D3/LuaSnip' },
            {   'rafamadriz/friendly-snippets'  },
        }
    }

    use 'eandrju/cellular-automaton.nvim'
    use 'laytan/cloak.nvim'
    use 'mbbill/undotree'
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    use 'tpope/vim-fugitive'
    use 'folke/zen-mode.nvim'

    use {
        'rose-pine/neovim', as = 'rose-pine', config = function()
            vim.cmd('colorscheme rose-pine')
        end 
    }

    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {   "nvim-lua/plenary.nvim" },
            {   "nvim-treesitter/nvim-treesitter"  }
        }
    }

    use "preservim/nerdtree"
    use "preservim/tagbar"

    use "vim-airline/vim-airline"

    use "lifepillar/pgsql.vim"

    use "ap/vim-css-color"
    use "rafi/awesome-vim-colorschemes"

    use "neoclide/coc.nvim"
    use "ryanoasis/vim-devicons"
    use "tc50cal/vim-terminal"
    use "terryma/vim-multiple-cursors"
    use "rstacruz/vim-closer"
    use "jiangmiao/auto-pairs"
    use "yuezk/vim-js"
    use "HerringtonDarkholme/yats.vim"
    use "maxmellon/vim-jsx-pretty"

end)