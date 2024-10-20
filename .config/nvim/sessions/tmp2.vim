let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/Documents/notes/index.norg
badd +6 ~/Documents/notes/Informatique/index.norg
badd +13 ~/Documents/notes/Informatique/Listes/index.norg
badd +9 ~/Documents/notes/Informatique/Listes/Livres.norg
badd +3 ~/Documents/notes/Informatique/Responsabilités/index.norg
badd +24 ~/Documents/notes/Informatique/Responsabilités/Data\ Structures/index.norg
badd +1 ~/Documents/notes/Informatique/Algorithmic.norg
argglobal
%argdel
edit ~/Documents/notes/Informatique/Responsabilités/Data\ Structures/index.norg
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt ~/Documents/notes/Informatique/Responsabilités/index.norg
setlocal fdm=expr
setlocal fde=v:lua.vim.treesitter.foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
let s:l = 6 - ((5 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 02|
wincmd w
argglobal
if bufexists(fnamemodify("~/Documents/notes/Informatique/Responsabilités/index.norg", ":p")) | buffer ~/Documents/notes/Informatique/Responsabilités/index.norg | else | edit ~/Documents/notes/Informatique/Responsabilités/index.norg | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/notes/Informatique/Responsabilités/index.norg
endif
balt ~/Documents/notes/Informatique/Algorithmic.norg
setlocal fdm=expr
setlocal fde=v:lua.vim.treesitter.foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 3 - ((2 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 026|
wincmd w
2wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
