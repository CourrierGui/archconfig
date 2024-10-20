local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'rafi/awesome-vim-colorschemes'
    use 'nvim-tree/nvim-web-devicons'
    use 'Famiu/feline.nvim'

    use {
        'junegunn/fzf.vim',
        requires = {
            'junegunn/fzf',
            run = ':call fzf#install()'
        }
    }
    use 'pechorin/any-jump.vim'
    use 'voldikss/vim-floaterm'
    use 'udalov/kotlin-vim'
    use 'christoomey/vim-tmux-navigator'

    use 'jackguo380/vim-lsp-cxx-highlight'
    use 'pboettch/vim-cmake-syntax'

    use 'jiangmiao/auto-pairs'
    use 'ludovicchabant/vim-gutentags'

    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-abolish'
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'
    use 'arthurxavierx/vim-caser'
    use 'Houl/repmo-vim'

    use 'lambdalisue/suda.vim'
    use 'karoliskoncevicius/vim-sendtowindow'

    use 'JuliaEditorSupport/julia-vim'
    use 'lervag/vimtex'
    use 'cespare/vim-toml'
    use 'vim-scripts/asmx86'
    use 'fidian/hexmode'
    use 'itspriddle/vim-shellcheck'

    use 'vim-pandoc/vim-pandoc-syntax'

    -- use 'ap/vim-css-color'

    use {
        'ThePrimeagen/harpoon',
        requires = 'nvim-lua/plenary.nvim',
    }

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- For vsnip users.
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- For luasnip users.
    -- use 'L3MON4D3/LuaSnip'
    -- use 'saadparwaiz1/cmp_luasnip'

    -- For ultisnips users.
    -- use 'SirVer/ultisnips'
    -- use 'quangnguyen30192/cmp-nvim-ultisnips'

    -- For snippy users.
    -- use 'dcampos/nvim-snippy'
    -- use 'dcampos/cmp-snippy'

    use {
        'folke/noice.nvim',
        requires = 'MunifTanjim/nui.nvim'
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires =  'nvim-lua/plenary.nvim'
    }
    use 'rcarriga/nvim-notify'
    use 'mrded/nvim-lsp-notify'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-treesitter/nvim-treesitter-context'
    }

    use 'vhyrro/luarocks.nvim'
    use {
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers",
        rocks = {
            "lua-utils.nvim",
            "nvim-nio",
            "nui.nvim",
            "plenary.nvim",
            "pathlib.nvim"
        },
        config = function()
            require('neorg').setup {
                ["load"] = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {
                        config = {
                            conceal = true,
                        }
                    },
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/Documents/notes",
                            },
                            default_workspace = "notes",
                        }
                    },
                    ["core.integrations.treesitter"] = {
                        config = {
                            configure_parsers = true,
                        }
                    },
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp"
                        }
                    },
                    ["core.qol.todo_items"] = {
                        config = {
                            create_todo_items = true,
                            create_todo_parents = true,
                        }
                    },
                }
            }
        end,
    }
    use "simrat39/rust-tools.nvim"
    use "dhananjaylatkar/cscope_maps.nvim"
end)
