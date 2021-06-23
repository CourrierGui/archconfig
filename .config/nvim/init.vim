"     _   __         _    ___                               _____
"    / | / /__  ____| |  / (_)___ ___     _________  ____  / __(_)___ _
"   /  |/ / _ \/ __ \ | / / / __ `__ \   / ___/ __ \/ __ \/ /_/ / __ `/
"  / /|  /  __/ /_/ / |/ / / / / / / /  / /__/ /_/ / / / / __/ / /_/ /
" /_/ |_/\___/\____/|___/_/_/ /_/ /_/   \___/\____/_/ /_/_/ /_/\__, /
"                                                             /____/

" vim-plug {{{

call plug#begin()

Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pechorin/any-jump.vim'
Plug 'voldikss/vim-floaterm'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'pboettch/vim-cmake-syntax'

Plug 'vimwiki/vimwiki'
Plug 'jiangmiao/auto-pairs'
Plug 'ludovicchabant/vim-gutentags'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'lambdalisue/suda.vim'
Plug 'karoliskoncevicius/vim-sendtowindow'

Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex'
Plug 'cespare/vim-toml'
Plug 'vim-scripts/asmx86'
Plug 'fidian/hexmode'

Plug 'CourrierGui/vim-potion'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'ap/vim-css-color'
Plug '~/dev/projects/concept/vim'

call plug#end()

" }}}

" Mappings {{{

let mapleader = ","
let localmapleader = "\\"
nnoremap <leader>, ,

" Copy and pasting with system clipboard
vnoremap <C-y> "*y :let @+=@*<CR>
noremap <leader>p "+P`[v`]=

" tab navigation causes <c-i> to be map to <tab>...
" nnoremap <tab> gt
" nnoremap <s-tab> gT

" save some key strokes
nnoremap <leader>w :write<cr>

" Format paragraphs
nnoremap <leader>gp gwap

" Remove trailing whitespaces
nnoremap <silent> <leader>tw mz:%s/\v\s+$//<cr>:noh<cr>`z

nnoremap <leader>sg :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nnoremap <leader>so :so $VIMRUNTIME/syntax/hitest.vim<cr>

" Make moving between wraped lines more intuitive
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$

" Place cursor at the middle of the screen after search
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" Execute current line with your shell interpreter and paste result in buffer
nnoremap Q !!$SHELL<CR>

" make moving between buffers easier
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" make scolling faster
nnoremap J 5j
nnoremap K 5k
noremap <leader>j J
noremap <leader>k K

" Jump to char under cursor
nnoremap <silent> <leader>f :execute "normal! f" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>
nnoremap <silent> <leader>F :execute "normal! F" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>
nnoremap <silent> <leader>t :execute "normal! t" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>
nnoremap <silent> <leader>T :execute "normal! T" . nr2char(strgetchar(getline('.')[col('.')-1:], 0))<cr>

" Code indentation
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> <leader><space> :noh<cr>
nnoremap <a-cr> o<esc>
nnoremap <leader>x xp

" Swap upper/lower case
nnoremap <leader>u g~iw
vnoremap <leader>u ~
inoremap <leader>u <esc>mzg~iwe`za

" use backspace to go to the previous location in the jumplist
nnoremap <backspace> <c-o>
" use enter to go to the next location in the jumplist
nnoremap <cr> <c-i>

" Add ; to the end of the line in insert mode and puts the cursor back at the same place
" Usefull for C/C++ programing
inoremap <c-e> <esc>mzA;<esc>`za

" buffer navigations
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bN :bp<CR>
nnoremap <silent> <leader>bs :b #<CR>

" make arrow keys usefull
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>
nnoremap <silent> <Left> :vertical resize -2<CR>
nnoremap <silent> <Right> :vertical resize +2<CR>

" Enable folding with the spacebar
nnoremap <space><space> za

" Move to file directory
nnoremap <silent> <leader>cd :cd %:p:h<cr>
nnoremap <silent> <leader>.. :cd ..<cr>

" Editing and sourcing ~/.vimrc
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<bar>highlight Normal guibg=NONE ctermbg=NONE<bar>echo "sourced!"<cr>

" netrw
nnoremap <silent> <leader>ee :Explore<CR>
nnoremap <silent> <leader>le :Lexplore<bar>vertical resize 30<CR>

" move block of code
vnoremap J :move '>+1<cr>gv=gv
vnoremap K :move '<-2<cr>gv=gv

" Vim sessions
" prepare command to create a new session
nnoremap <A-s>n :wa<Bar>mksession ~/.config/nvim/sessions/
" Save current session and prepare to load a new one
nnoremap <A-s>s :wa<Bar>exe "mksession! " . v:this_session<CR>
nnoremap <A-s>o :!ls ~/.config/nvim/sessions<cr>:so ~/.config/nvim/sessions/

" Open definition in a vertical split by default
nnoremap <c-w><c-]> <c-w>v<c-]>

" Terminal Mappings
" tnoremap <esc> <c-\><c-n>
tnoremap <c-\> <c-\><c-n>

" Operator-Pending Mappings
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

" Command mappings
" start of line
cnoremap <c-z>    <Home>
" back one character
cnoremap <c-h>    <Left>
" delete character under cursor
cnoremap <c-x>    <Del>
" end of line
cnoremap <c-a>    <End>
" forward one character
cnoremap <c-l>    <Right>
" recall newer command-line
cnoremap <c-j>    <Down>
" recall previous (older) command-line
cnoremap <c-k>    <Up>
" back one word
cnoremap <c-b>    <S-Left>
" forward one word
cnoremap <c-w>    <S-Right>

" Root permission inside of neovim, why Neovim ? :-(
command! W :w suda://%
command! Surf :execute "!surf " . expand("%:p")
command! FindTODO :vimgrep /\<TODO\>/j ** <bar> copen

" find and fix 'suckless' style function definitions
command! ReplaceCDefs
  \ :%s/^\s*\([a-zA-Z* _]\+\)\s*\n\([a-zA-Z0-9_]\+\)(\(\(.\|\n\)\{-\}\)\n\?{$/\1 \2(\3 {/c

nnoremap <a-t>n :FloatermNew<cr>
nnoremap <a-t>t :FloatermToggle<cr>

" }}}

" Options {{{

syntax on

" search for local config files at startup
set exrc
set secure

set number
set relativenumber
set ttimeoutlen=10
set splitbelow splitright
set cursorline

" See substitution as you type them
set inccommand=split

" Tab to spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" File fuzzy finding
set path+=**
set wildignore+=**/build/**

" See matching character
set showmatch

" Better indentation
set smartindent
set cindent
" Better C++ indentation of lambda function
set cino=j1,(0,ws,Ws

" Display trailing whitespace and tabs
set list
set listchars=tab:\|\ ,trail:·

" french and english spelling
set spelllang=en
set tags+=/

" }}}

" Plugin options {{{

" vimwiki
let g:vimwiki_list = [
  \ { 'path': '~/.config/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki' },
  \ { 'path': '~/Documents/wiki',   'syntax': 'markdown', 'ext': '.wiki' }
  \]
let g:vimwiki_global_ext = 0
let g:vimwiki_map_prefix = '<leader>v'
let g:vimwiki_key_mappings = {
      \   'all_maps': 1,
      \   'global': 0,
      \   'headers': 1,
      \   'text_objs': 1,
      \   'table_format': 1,
      \   'table_mappings': 1,
      \   'lists': 1,
      \   'links': 1,
      \   'html': 1,
      \   'mouse': 0,
      \ }

" Redefine the mappings because they suck...
nmap <leader>vww <Plug>VimwikiIndex
nmap <leader>vws <Plug>VimwikiUISelect
nmap <leader>vdd <Plug>VimwikiDiaryIndex
nmap <leader>vdu <Plug>VimwikiDiaryGenerateLinks
nmap <leader>vde <Plug>VimwikiMakeDiaryNote
nmap <leader>vdp <Plug>VimwikiDiaryPrevDay
nmap <leader>vdn <Plug>VimwikiDiaryNextDay

" Any Jump
let g:any_jump_disable_default_keybindings = 1

" Normal mode: Jump to definition under cursor
nnoremap <A-a> :AnyJump<CR>
" Visual mode: jump to selected text in visual mode
xnoremap <A-v> :AnyJumpVisual<CR>
" Normal mode: open previous opened file (after jump)
nnoremap <A-b> :AnyJumpBack<CR>
" Normal mode: open last closed search window again
nnoremap <A-l> :AnyJumpLastResults<CR>

" Fzf
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

nnoremap <leader>o :Files<cr>
nnoremap <leader>tt :Tags<cr>
nnoremap // :BLines<cr>
nnoremap ?? :Rg<cr>
nnoremap cc :Commands<cr>
nnoremap gb :Buffers<cr>
command! FileHistory execute ":BCommits"

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_powerline_fonts=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_theme='bubblegum'

" Coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-l> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

let g:coc_global_extensions=[
  \ "coc-julia",
  \ "coc-json",
  \ "coc-vimtex",
  \ "coc-clangd",
  \ "coc-cmake",
  \ "coc-python",
  \ "coc-snippets",
  \ "coc-rls",
  \ "coc-sh",
  \ "coc-css",
  \ "coc-tsserver",
  \ "coc-html"
  \ ]

" Go to definition under cursor
nmap <silent> <leader>gd <Plug>(coc-definition)

" vimtex
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'

" transparent background when opening vim
autocmd vimenter * highlight Normal guibg=NONE ctermbg=NONE

colorscheme nord

" }}}

" C++ file settings {{{
augroup filetype_cpp
  autocmd!
  " Switch between header and source file
  autocmd FileType cpp nmap <silent> <leader>a :CocCommand clangd.switchSourceHeader<cr>
  " Display symbol inforamtion
  autocmd FileType cpp nmap <silent> <leader>i :CocCommand clangd.symbolInfo<cr>
augroup END
" }}}

" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker | setlocal foldlevel=0
  autocmd BufLeave ~/.config/nvim/init.vim :source $MYVIMRC | highlight Normal guibg=NONE ctermbg=NONE | echo "sourced!"
augroup END
" }}}

" XML/HTML file settings {{{
augroup filetype_html
  autocmd!
  autocmd BufNewFile,BufRead *.launch,*.ui set filetype=xml
  autocmd FileType html nnoremap <buffer> <leader>ss :Surf<cr>
augroup END
" }}}

" Lisp file settings {{{
augroup filetype_python
  autocmd!
  autocmd FileType lisp setlocal nocindent
augroup end
" }}}

" Python file settings {{{
augroup filetype_python
  autocmd!
  autocmd BufNewFile,BufRead python setlocal tabstop=4 softtabstop=4 textwidth=120 autoindent fileformat=unix foldlevel=1
  autocmd FileType python nnoremap <buffer> <localleader>r :CocCommand python.execInTerminal<CR>
augroup end
" }}}

" Markdown file settings {{{
augroup filetype_md
  autocmd!
  autocmd FileType markdown setlocal nocindent
  autocmd FileType markdown nnoremap <buffer> <localleader>s :!mupdf $(echo % \| sed 's/md$/pdf/') & disown<CR>
  autocmd FileType markdown nnoremap <buffer> <localleader>c :w<bar>!pandoc -so $(echo % \| sed 's/md$/pdf/') % <CR>:!pkill -HUP mupdf<CR>
augroup END
" }}}

" pandoc file settings {{{
augroup pandoc_syntax
  autocmd!
  autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
  autocmd FileType markdown.pandoc setlocal nocindent
  autocmd FileType markdown.pandoc nnoremap <buffer> <localleader>s :!mupdf $(echo % \| sed 's/md$/pdf/') & disown<CR>
  autocmd FileType markdown.pandoc nnoremap <buffer> <localleader>c :w<bar>!pandoc -so $(echo % \| sed 's/md$/pdf/') % <CR>:!pkill -HUP mupdf<CR>
augroup END
" }}}

" Suckless auto build {{{
augroup suckless
  autocmd!
  " autocmd BufRead config.h nnoremap <localleader>c :termopen<cr>icd ~/softwares/suckless/dwmblocks; sudo -S make install && { killall -q dwmblocks; setsid dwmblocks& }")<cr>
  autocmd BufRead config.h nnoremap <localleader>c :w<bar>new<bar>terminal<cr>isudo make install && { killall -q dwmblocks; setsid dwmblocks& }<cr>
" }}}

" Vimwiki {{{
" nnoremap <localleader>now :.!date<cr>I**<esc>A**<esc>
augroup vimwiki_file
  autocmd!
  autocmd FileType vimwiki nnoremap <buffer> <localleader>now :.!date<cr>I**<esc>A**<esc>
  autocmd FileType vimwiki setlocal spell spelllang=en,fr
augroup END
" }}}

" More autocmd {{{
augroup more_autocmd
  autocmd!
  autocmd InsertEnter * :setlocal nohlsearch
  autocmd InsertLeave * :setlocal hlsearch
  autocmd BufNewFile,BufRead * nnoremap <silent>
        \ <localleader>c mz:make<CR>`z
  " autocmd BufNewFile,BufRead * nnoremap <silent>
  "       \ <localleader>c :silent make unsilent echo "Done."<CR>
  autocmd Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|DONE)/
        \ containedin=.*Comment,vimCommentTitle
  autocmd BufNewFile,BufRead *.scan set filetype=config
augroup END

highlight def link MyTodo vimTodo

" }}}

" Functions {{{

function! SwitchHeader(cmd)
  let filename = expand("%:t:r")
  if expand("%:e") == "hpp"
    let filename = filename . ".cpp"
    execute(a:cmd . " " . filename)
  elseif expand("%:e") == "cpp"
    let filename = filename . ".hpp"
    execute(a:cmd . " " . filename)
  endif
endfunction

function! WC()
  let filename = expand("%")
  let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
  let result = system(cmd)
  echo result . " words"
endfunction

" }}}

