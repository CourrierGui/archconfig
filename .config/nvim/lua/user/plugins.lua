local install_path = vim.fn.stdpath('data')
    .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'rafi/awesome-vim-colorschemes'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    use {
        'junegunn/fzf', run = function() vim.fn['fzf#install()'](0) end
    }
    use 'junegunn/fzf.vim'
    use 'pechorin/any-jump.vim'
    use 'voldikss/vim-floaterm'

    use 'jackguo380/vim-lsp-cxx-highlight'
    use 'pboettch/vim-cmake-syntax'

    use 'vimwiki/vimwiki'
    -- use 'tools-life/taskwiki'
    use 'jiangmiao/auto-pairs'
    use 'ludovicchabant/vim-gutentags'

    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-abolish'
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'

    use 'lambdalisue/suda.vim'
    use 'karoliskoncevicius/vim-sendtowindow'

    use 'JuliaEditorSupport/julia-vim'
    use 'lervag/vimtex'
    use 'cespare/vim-toml'
    use 'vim-scripts/asmx86'
    use 'fidian/hexmode'
    use 'itspriddle/vim-shellcheck'

    use 'vim-pandoc/vim-pandoc-syntax'

    use 'ap/vim-css-color'

    use 'nvim-lua/plenary.nvim'

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

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
            }
        end,
        requires = "nvim-lua/plenary.nvim"
    }
end)

-- Vimwiki
-- Why redefine localleader???
vim.g.taskwiki_maplocalleader = "\\"
vim.g.vimwiki_map_prefix = "<leader>v"
vim.g.vimwiki_key_mappings = {
    all_maps = 1,
    global = 0,
    headers = 1,
    text_objs = 1,
    table_format = 1,
    table_mappings = 1,
    lists = 1,
    links = 1,
    html = 1,
    mouse = 0,
}
vim.g.vimwiki_list = {
    { path = '~/Documents/vimwiki', syntax = 'markdown', ext = '.wiki' },
    { path = '~/Documents/wiki',    syntax = 'markdown', ext = '.wiki' },
    { path = '~/Documents/para',    syntax = 'markdown', ext = '.wiki' },
}

-- Redefine the mappings because they suck...
vim.keymap.set('n', '<leader>vww', '<Plug>VimwikiIndex')
vim.keymap.set('n', '<leader>vws', '<Plug>VimwikiUISelect')
vim.keymap.set('n', '<leader>vdd', '<Plug>VimwikiDiaryIndex')
vim.keymap.set('n', '<leader>vdu', '<Plug>VimwikiDiaryGenerateLinks')
vim.keymap.set('n', '<leader>vde', '<Plug>VimwikiMakeDiaryNote')
vim.keymap.set('n', '<leader>vdp', '<Plug>VimwikiDiaryPrevDay')
vim.keymap.set('n', '<leader>vdn', '<Plug>VimwikiDiaryNextDay')

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

-- vim-airline
vim.g.airline_powerline_fonts = 1
vim.g.airline_detect_modified = 1
vim.g.airline_detect_paste = 1
vim.g.airline_theme = 'bubblegum'

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
