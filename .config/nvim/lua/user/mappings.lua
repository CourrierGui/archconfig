vim.g.mapleader = ','
vim.keymap.set('n', '<leader>,', ',')

-- Copy and pasting with system clipboard
vim.keymap.set('v', '<C-y>', '"*y :let @+=@*<CR>')
vim.keymap.set('', '<leader>p', '"+P`[v`]=')

-- save some key strokes
vim.keymap.set('n', '<leader>w', ':write<cr>')

-- Format paragraphs
vim.keymap.set('n', '<leader>gp', 'gwap')

-- Remove trailing white spaces
vim.keymap.set('n', '<leader>tw',
    'mz:%s/\\v\\s+$//<cr>:noh<cr>`z',
    {silent = true})

vim.keymap.set('n', '<leader>sg',
    [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>]])
vim.keymap.set('n', '<leader>so', ':so $VIMRUNTIME/syntax/hitest.vim<cr>')

-- Make moving between wrapped lines more intuitive
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '0', 'g0')
vim.keymap.set('n', '^', 'g^')
vim.keymap.set('n', '$', 'g$')

-- Place cursor at the middle of the screen after search
vim.keymap.set('n', 'n', 'nzz', {silent = true})
vim.keymap.set('n', 'N', 'Nzz', {silent = true})
vim.keymap.set('n', '*', '*zz', {silent = true})
vim.keymap.set('n', '#', '#zz', {silent = true})

-- Execute current line with your shell interpreter and paste result in buffer
vim.keymap.set('n', 'Q', '!!$SHELL<CR>')

-- make moving between buffers easier
vim.keymap.set('n', 'gh', '<C-w>h')
vim.keymap.set('n', 'gj', '<C-w>j')
vim.keymap.set('n', 'gk', '<C-w>k')
vim.keymap.set('n', 'gl', '<C-w>l')

-- make scrolling faster
vim.keymap.set('n', 'J', '5j')
vim.keymap.set('n', 'K', '5k')
vim.keymap.set('n', '<leader>j', 'J')
vim.keymap.set('n', '<leader>k', 'K')

-- Jump to char under cursor
vim.keymap.set('n', '<leader>f',
    [[:execute "normal! f" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>]],
    {silent = true})
vim.keymap.set('n', '<leader>F',
    [[:execute "normal! F" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>]],
    {silent = true})
vim.keymap.set('n', '<leader>t',
    [[:execute "normal! t" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>]],
    {silent = true})
vim.keymap.set('n', '<leader>T',
    [[:execute "normal! T" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>]],
    {silent = true})

-- Code indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('n', '<leader><space>', ':noh<cr>', {silent = true})
vim.keymap.set('n', '<a-cr>', 'o<esc>')
vim.keymap.set('n', '<leader>x', 'xp')

-- Swap upper/lower case
vim.keymap.set('n', '<leader>u', 'g~iw')
vim.keymap.set('v', '<leader>u', '~')
vim.keymap.set('i', '<leader>u', '<esc>mzg~iwe`za')

-- use backspace to go to the previous location in the jump list
vim.keymap.set('n', '<backspace>', '<c-o>')
-- use enter to go to the next location in the jump list
vim.keymap.set('n', '<cr>', '<c-i>')

-- Add ; to the end of the line in insert mode and puts the cursor back at the
-- same place
-- Useful for C/C++ programming
vim.keymap.set('i', '<c-e>', '<esc>mzA;<esc>`za')

-- Fix the last spelling mistake
vim.keymap.set('n', '<leader>sp', 'mz[s1z=`z')

-- buffer navigations
vim.keymap.set('n', '<leader>bn', ':bn<CR>', {silent = true})
vim.keymap.set('n', '<leader>bN', ':bp<CR>', {silent = true})
vim.keymap.set('n', '<leader>bs', ':b #<CR>', {silent = true})

-- make arrow keys useful
vim.keymap.set('n', '<Up>', ':resize +2<CR>', {silent = true})
vim.keymap.set('n', '<Down>', ':resize -2<CR>', {silent = true})
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', {silent = true})
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', {silent = true})

-- Enable folding with the spacebar
vim.keymap.set('n', '<space><space>', 'za')

-- Move to file directory
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<cr>', {silent = true})
vim.keymap.set('n', '<leader>..', ':cd ..<cr>', {silent = true})

-- Editing and sourcing ~/.vimrc
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<CR>', {silent = true})
vim.keymap.set('n', '<leader>sv',
    ':source $MYVIMRC<bar>highlight Normal guibg=NONE ctermbg=NONE<bar>echo "sourced!"<cr>')

-- netrw
vim.keymap.set('n', '<leader>ee', ':Explore<CR>', {silent = true})
vim.keymap.set('n', '<leader>le',
    ':Lexplore<bar>vertical resize 30<CR>', {silent = true})

-- move block of code
vim.keymap.set('v', 'J', ':move \'>+1<cr>gv=gv')
vim.keymap.set('v', 'K', ':move \'<-2<cr>gv=gv')

-- Vim sessions
-- prepare command to create a new session
vim.keymap.set('n', '<A-s>n', ':wa<Bar>mksession ~/.config/nvim/sessions/')
-- Save current session and prepare to load a new one
vim.keymap.set('n', '<A-s>s', ':wa<Bar>exe "mksession! " . v:this_session<CR>')
vim.keymap.set('n', '<A-s>o',
    ':!ls ~/.config/nvim/sessions<cr>:so ~/.config/nvim/sessions/')

-- cscope mappings
vim.keymap.set('n', '<leader>fs',
    ':cs find s <c-r>=expand(\'<cword>\')<cr><cr>')
vim.keymap.set('n', '<leader>fc',
    ':cs find c <c-r>=expand(\'<cword>\')<cr><cr>')
vim.keymap.set('n', '<leader>fg',
    ':cs find g <c-r>=expand(\'<cword>\')<cr><cr>')
vim.keymap.set('n', '<leader>fm',
    ':cs find a <c-r>=expand(\'<cword>\')<cr><cr>')

-- Open definition in a vertical split by default
vim.keymap.set('n', '<c-w><c-]>', '<c-w>v<c-]>')

-- Terminal Mappings
-- tnoremap <esc> <c-\><c-n>
vim.keymap.set('t', '<c-\\>', '<c-\\><c-n>')

-- Operator-Pending Mappings
vim.keymap.set('o', 'in(', ':<c-u>normal! f(vi(<cr>')
vim.keymap.set('o', 'il(', ':<c-u>normal! F)vi(<cr>')
vim.keymap.set('o', 'in{', ':<c-u>normal! f{vi{<cr>')
vim.keymap.set('o', 'il}', ':<c-u>normal! F}vi}<cr>')

-- Command mappings
-- start of line
vim.keymap.set('c', '<c-z>', '<Home>')
-- back one character
vim.keymap.set('c', '<c-h>', '<Left>')
-- delete character under cursor
vim.keymap.set('c', '<c-x>', '<Del>')
-- end of line
vim.keymap.set('c', '<c-a>', '<End>')
-- forward one character
vim.keymap.set('c', '<c-l>', '<Right>')
-- recall newer command-line
vim.keymap.set('c', '<c-j>', '<Down>')
-- recall previous (older) command-line
vim.keymap.set('c', '<c-k>', '<Up>')
-- back one word
vim.keymap.set('c', '<c-b>', '<S-Left>')
-- forward one word
vim.keymap.set('c', '<c-w>', '<S-Right>')
