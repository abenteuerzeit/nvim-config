-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Plugin Manager
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    -- UI Enhancements
    use 'lifepillar/pgsql.vim'
    use 'vim-airline/vim-airline'
    use 'eandrju/cellular-automaton.nvim' -- Unique visual enhancement
    use {
        'rose-pine/neovim', as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }
    use 'folke/zen-mode.nvim' -- Distraction-free coding environment
    use "ap/vim-css-color"
    use "rafi/awesome-vim-colorschemes"

    -- Navigation & Searching
    use	{
	    'nvim-telescope/telescope.nvim', tag = '0.1.6',
	    requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- use 'preservim/nerdtree'

    -- Git Integration
    use 'tpope/vim-fugitive'

    -- Text Manipulation & Utilities
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'mbbill/undotree'
    use 'laytan/cloak.nvim' -- Secret management

    -- Language Support & Syntax Highlighting
    use 'nvim-treesitter/nvim-treesitter-context'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    }
    use "yuezk/vim-js"
    use "HerringtonDarkholme/yats.vim"
    use "maxmellon/vim-jsx-pretty"
    use 'nvim-treesitter/playground' -- Treesitter playground for inspecting syntax

    -- Diagnostic & Code Analysis Tools
    use {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {}
        end
    }

    -- Coding & Development Tools
    use 'github/copilot.vim' -- GitHub Copilot support
    use {
        'ThePrimeagen/refactoring.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-treesitter/nvim-treesitter' }
        }
    }
    use 'ThePrimeagen/vim-be-good' -- Neovim game for practicing skills

    -- LSP & Autocompletion
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    }

    -- Alternative Autocompletion & Snippets
    --[[
    use {
        'neoclide/coc.nvim',
        branch = 'release' -- Consider using either coc.nvim or the lsp-zero stack for consistency
    }
    --]]

    -- Utilities & Others

    --    use 'ThePrimeagen/harpoon' -- Project navigation and management
    -- use 'nvim-lua/plenary.nvim' -- Common utilities required by many plugins
    use	{
	    'ThePrimeagen/harpoon', branch = 'harpoon2',
	    requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- use 'preservim/tagbar'
    -- use "tc50cal/vim-terminal"
    -- use "terryma/vim-multiple-cursors"

    -- plugin issues
    -- use "rstacruz/vim-closer" -- crashes
    -- use "jiangmiao/auto-pairs" -- error key not present in dictionary
    -- use "ryanoasis/vim-devicons" -- crashes on PackerSync

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })

end)

