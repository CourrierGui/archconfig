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
badd +141 Documents/notes/index.norg
badd +7 Documents/notes/Notes\ Vim\ Wiki.norg
badd +0 Documents/notes/Sport.norg
badd +5 Documents/notes/Nutrition.norg
badd +12 Documents/notes/Nutrition\ App.norg
badd +1 Documents/vimwiki/Skills/Apprendre/index.wiki
badd +1 Documents/vimwiki/Skills/Écrire/index.wiki
badd +1 Documents/vimwiki/Skills/Smalltalk.wiki
badd +24 Documents/notes/Langues.norg
badd +3 Documents/notes/Humour.norg
badd +1 Documents/notes/Skills/index.norg
badd +1 Documents/vimwiki/Skills/échecs.wiki
badd +9 Documents/notes/Parler.norg
badd +20 ~/Documents/notes/Habitudes.norg
badd +1 ~/Documents/vimwiki/Apprentissage/index.wiki
argglobal
%argdel
$argadd Documents/vimwiki/Skills/Écrire/index.wiki
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit ~/Documents/notes/Habitudes.norg
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
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
argglobal
balt Documents/notes/index.norg
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
let s:l = 32 - ((31 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 32
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("Documents/notes/Sport.norg", ":p")) | buffer Documents/notes/Sport.norg | else | edit Documents/notes/Sport.norg | endif
if &buftype ==# 'terminal'
  silent file Documents/notes/Sport.norg
endif
balt Documents/notes/index.norg
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=4
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
let s:l = 4 - ((3 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 02|
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit Documents/notes/Notes\ Vim\ Wiki.norg
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
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
argglobal
balt Documents/notes/index.norg
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 7 - ((6 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 7
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/Documents/vimwiki/Apprentissage/index.wiki", ":p")) | buffer ~/Documents/vimwiki/Apprentissage/index.wiki | else | edit ~/Documents/vimwiki/Apprentissage/index.wiki | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/vimwiki/Apprentissage/index.wiki
endif
balt Documents/notes/Notes\ Vim\ Wiki.norg
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
tabnext 2
set stal=1
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
