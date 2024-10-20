local startup = vim.api.nvim_create_augroup('startup', {clear = true})
vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    group = startup,
    -- Switch between header and source file
    command = 'if expand("%") == "" | e . | endif'
})

-- C++ file settings
local cpp = vim.api.nvim_create_augroup('filetype_cpp', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cpp',
    group = cpp,
    -- Switch between header and source file
    command = 'nmap <silent> <leader>a :CocCommand clangd.switchSourceHeader<cr>'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cpp',
    group = cpp,
    -- Display symbol information
    command = 'nmap <silent> <leader>i :CocCommand clangd.symbolInfo<cr>'
})

-- Vimscript file settings
local vvim = vim.api.nvim_create_augroup('filetype_vim', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'vim',
    group = vvim,
    command = 'setlocal foldmethod=marker | setlocal foldlevel=0'
})
vim.api.nvim_create_autocmd('BufLeave', {
    pattern = '~/.config/nvim/init.vim ',
    group = vvim,
    command = ':source $MYVIMRC | highlight Normal guibg=NONE ctermbg=NONE | echo "sourced!"'
})

-- XML/HTML file settings
local xml = vim.api.nvim_create_augroup('filetype_xml', {clear = true})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead'}, {
    pattern = '*.launch,*.ui',
    group = xml,
    command = 'set filetype=xml'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'html',
    group = xml,
    command = 'nnoremap <buffer> <leader>ss :Surf<cr>'
})

-- Lisp file settings
local lisp = vim.api.nvim_create_augroup('filetype_lisp', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'lisp',
    group = lisp,
    command = 'setlocal nocindent'
})

-- Python file settings
local python = vim.api.nvim_create_augroup('filetype_python', {clear = true})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = 'python',
    group = python,
    command = 'setlocal tabstop=4 softtabstop=4 textwidth=120 autoindent fileformat=unix foldlevel=1'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    group = python,
    command = 'nnoremap <buffer> <localleader>r :CocCommand python.execInTerminal<CR>'
})

-- Markdown file settings
local md = vim.api.nvim_create_augroup('filetype_markdown', {clear = true})

local function add_ft_autocmd(cmd)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown,markdown.pandoc',
        group = md,
        command = cmd
    })
end

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufFilePre', 'BufRead' }, {
    pattern = '*.md',
    group = md,
    command = 'set filetype=markdown.pandoc'
})
add_ft_autocmd('setlocal nocindent')
add_ft_autocmd('nnoremap <buffer> <localleader>s :!mupdf $(echo % \\| sed ')
add_ft_autocmd('nnoremap <buffer> <localleader>c :w<bar>!pandoc -so $(echo % \\| sed "s/md$/pdf/") % <CR>:!pkill -HUP mupdf<CR>')

-- Vimwiki
local vimwiki = vim.api.nvim_create_augroup('filetype_vimwiki', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'vimwiki',
    group = vimwiki,
    command = 'setlocal spell spelllang=en,fr'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'vimwiki',
    group = vimwiki,
    command = 'nnoremap <buffer> <localleader>now :.!date<cr>I**<esc>A**<esc>'
})

-- Neorg autocmd
local neorg = vim.api.nvim_create_augroup('neorg', {clear = true})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*.norg',
    group = neorg,
    command = 'setlocal conceallevel=2'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'norg',
    group = neorg,
    command = 'setlocal spell spelllang=en,fr'
})

-- More autocmd
local other = vim.api.nvim_create_augroup('more_autocmd', {clear = true})
vim.api.nvim_create_autocmd('InsertEnter', {
    pattern = '*',
    group = other,
    command = 'setlocal nohlsearch'
})
vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = '*',
    group = other,
    command = 'setlocal hlsearch'
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '*',
    group = other,
    command = 'nnoremap <silent> <localleader>c mz:make<CR>`z'
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '*.scan',
    group = other,
    command = 'set filetype=config'
})
vim.api.nvim_create_autocmd('Syntax', {
    pattern = '*',
    group = other,
    command = [[syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|DONE)/ containedin=.*Comment,vimCommentTitle]]
})
-- autocmd BufNewFile,BufRead * nnoremap <silent>
--       \ <localleader>c :silent make unsilent echo "Done."<CR>

vim.cmd [[
    highlight def link MyTodo vimTodo
]]
