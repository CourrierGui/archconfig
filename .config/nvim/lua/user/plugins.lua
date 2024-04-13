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
end)

require('nvim-web-devicons').get_icons()

require("notify").setup({
    background_colour = "#000000",
})

require('lsp-notify').setup({
    notify = require('notify'),
})

require("noice").setup({
    views = {
        cmdline_popup = {
            position = {
                row = 5,
                col = "50%",
            },
            size = {
                width = 60,
                height = "auto",
            },
        },
        popupmenu = {
            -- relative = "editor",
            position = {
                row = 8,
                col = "50%",
            },
            size = {
                width = 60,
                height = 10,
            },
            border = {
                style = "rounded",
                padding = { 0, 1 },
            },
            win_options = {
                winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
        },
    },
    lsp = {
        progress = {
            -- let nvim-notify and nvim-lsp-notify handle this
            enabled = false,
        },
    },
})

require("nvim-treesitter.configs").setup {
    modules = {},
    sync_install = false,
    auto_install = false,
    ignore_install = {},
    ensure_installed = {
        'bash',
        'c',
        'cpp',
        'doxygen',
        'lua',
        'markdown',
        'markdown_inline',
        'norg',
        'regex',
        'rust',
        'vim',
        'zig',
    },
    highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = false,
    },
}

require('nvim-web-devicons').setup {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
        }
    };
    -- globally enable different highlight colors per icon (default to true)
    -- if set to false all icons will have the default icon's color
    color_icons = true;
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
    -- globally enable "strict" selection of icons - icon will be looked up in
    -- different tables, first by filename, and if not found by extension; this
    -- prevents cases when file doesn't have any extension but still gets some icon
    -- because its name happened to match some extension (default to false)
    strict = true;
    -- same as `override` but specifically for overrides by filename
    -- takes effect when `strict` is true
    override_by_filename = {
        [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
        }
    };
    -- same as `override` but specifically for overrides by extension
    -- takes effect when `strict` is true
    override_by_extension = {
        ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
        }
    };
}

require('feline').setup()
require('feline').winbar.setup()

-- Any Jump
vim.g.any_jump_disable_default_keybindings = 1

-- Normal mode: Jump to definition under cursor
vim.keymap.set('n', '<A-a>', ':AnyJump<cr>')
-- Visual mode: jump to selected text in visual mode
vim.keymap.set('n', '<A-v>', ':AnyJumpVisual<cr>')
-- Normal mode: open previous opened file (after jump)
vim.keymap.set('n', '<A-b>', ':AnyJumpBack<cr>')
-- Normal mode: open last closed search window again
vim.keymap.set('n', '<A-l>', ':AnyJumpLastResults<cr>')

-- Fzf
vim.g.fzf_vim = {}
vim.g.fzf_layout = { window =  { width = 0.95, height = 0.95 } }
vim.g.fzf_commits_log_options =
    '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

vim.keymap.set('n', '<leader>o', ':Files<cr>')
vim.keymap.set('n', '<leader>tt', ':Tags<cr>')
vim.keymap.set('n', '//', ':BLines<cr>')
vim.keymap.set('n', '??', ':Rg<cr>')
vim.keymap.set('n', 'cc', ':Commands<cr>')
vim.keymap.set('n', 'gb', ':Buffers<cr>')

vim.api.nvim_create_user_command(
    'FileHistory',
    'execute ":BCommits"',
    {}
)

-- vimtex
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.tex_flavor = 'latex'

-- transparent background when opening vim
local augroup = vim.api.nvim_create_augroup('highlight_cmds', {clear = true})
vim.api.nvim_create_autocmd('vimenter', {
    pattern = '*',
    group = augroup,
    command = 'highlight Normal guibg=NONE ctermbg=NONE'
})

vim.opt.termguicolors = true
vim.cmd [[
    syntax enable
    colorscheme gotham
    highlight Visual cterm=bold ctermbg=None
    highlight Visual gui=bold guibg=None
]]

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>hq", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>hs", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>hd", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>hf", function() ui.nav_file(4) end)
