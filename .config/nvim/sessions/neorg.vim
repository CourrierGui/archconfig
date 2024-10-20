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
badd +214 ~/Documents/notes/index.norg
badd +4 ~/Documents/notes/Data\ Structures.norg
badd +344 ~/Documents/notes/Sport.norg
badd +50 Documents/notes/Notes\ Vim\ Wiki.norg
badd +95 Documents/notes/Software\ Design.norg
badd +120 Documents/notes/Stuff.norg
badd +2 ~/Documents/notes/Concurrency.norg
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit ~/Documents/notes/index.norg
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
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
exe 'vert 1resize ' . ((&columns * 62 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 62 + 94) / 189)
exe 'vert 3resize ' . ((&columns * 63 + 94) / 189)
argglobal
balt ~/Documents/notes/Concurrency.norg
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
110
normal! zo
let s:l = 214 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 214
normal! 015|
wincmd w
argglobal
if bufexists(fnamemodify("~/Documents/notes/index.norg", ":p")) | buffer ~/Documents/notes/index.norg | else | edit ~/Documents/notes/index.norg | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/notes/index.norg
endif
balt ~/Documents/notes/index.norg
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
110
normal! zo
let s:l = 259 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 259
normal! 04|
wincmd w
argglobal
if bufexists(fnamemodify("~/Documents/notes/index.norg", ":p")) | buffer ~/Documents/notes/index.norg | else | edit ~/Documents/notes/index.norg | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/notes/index.norg
endif
balt ~/Documents/notes/index.norg
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
110
normal! zo
let s:l = 304 - ((44 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 304
normal! 04|
wincmd w
exe 'vert 1resize ' . ((&columns * 62 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 62 + 94) / 189)
exe 'vert 3resize ' . ((&columns * 63 + 94) / 189)
tabnext
edit Documents/notes/Software\ Design.norg
argglobal
balt Documents/notes/Stuff.norg
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
2
normal! zo
94
normal! zo
100
normal! zo
let s:l = 194 - ((23 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 194
normal! 06|
tabnext 1
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
