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
badd +129 Documents/notes/index.norg
badd +23 Documents/vimwiki/index.wiki
badd +112 Documents/vimwiki/Flat.wiki
badd +2 Documents/vimwiki/para/index.wiki
badd +5 Documents/vimwiki/para/Projects/projects.wiki
badd +3 Documents/vimwiki/subjects/index.wiki
badd +25 Documents/vimwiki/subjects/Informatique/index.wiki
badd +3 Documents/vimwiki/subjects/Informatique/Games.wiki
badd +4 Documents/vimwiki/subjects/Informatique/Server.wiki
badd +1 Documents/vimwiki/subjects/Informatique/Technologies.wiki
badd +1 Documents/vimwiki/subjects/Informatique/Books.wiki
badd +1 Documents/vimwiki/subjects/Informatique/Linux.wiki
badd +1 Documents/vimwiki/subjects/Informatique/Artix.wiki
badd +1 Documents/vimwiki/subjects/Informatique/tools.wiki
badd +1 Documents/vimwiki/subjects/Informatique/development.wiki
badd +1 Documents/vimwiki/subjects/Informatique/OS.wiki
badd +1 Documents/vimwiki/subjects/Informatique/libraries.wiki
badd +1 Documents/vimwiki/subjects/Informatique/languages.wiki
badd +1 Documents/vimwiki/subjects/Informatique/Knowledge\ Tree.wiki
badd +1 Documents/vimwiki/subjects/Informatique/YAPL.wiki
badd +4 Documents/vimwiki/para/Projects/Haskell.wiki
badd +5 Documents/vimwiki/para/Areas/areas.wiki
badd +3 Documents/vimwiki/para/Areas/Computer\ Science.wiki
badd +3 Documents/vimwiki/para/Areas/Lambda\ Calculus.wiki
badd +10 Documents/vimwiki/para/Areas/Programmation.wiki
badd +1 Documents/vimwiki/para/Areas/fonctionnel.wiki
badd +1 Documents/notes/Virtuose.norg
badd +1 Documents/notes/Personal\ Data\ Management/index.norg
badd +2 Documents/notes/Management.norg
badd +1 Documents/notes/GTD.norg
badd +1 Documents/notes/Philosophy/index.norg
badd +1 Documents/notes/Science/index.norg
badd +96 Documents/notes/Computer/index.norg
badd +3 Documents/notes/Complexity.norg
badd +1 Documents/notes/Robotics/index.norg
badd +1 Documents/notes/Mathematics/index.norg
badd +1 Documents/notes/Machine\ Learning/index.norg
badd +1 Documents/notes/Health/index.norg
badd +1 Documents/notes/Art/index.norg
badd +1 Documents/notes/Music/index.norg
badd +1 Documents/notes/Cinema/index.norg
badd +1 Documents/notes/Economy/index.norg
badd +1 Documents/notes/Politics/index.norg
badd +1 Documents/notes/Linguistics/index.norg
badd +1 Documents/notes/Skills/index.norg
badd +1 Documents/notes/Poems.norg
badd +1 Documents/notes/Flat.norg
badd +1 Documents/notes/Documents.norg
badd +1 Documents/notes/Personal\ Knowledge\ Management.norg
badd +1 Documents/notes/Paper\ Work.norg
badd +15 Documents/notes/Apprentissage.norg
badd +1 Documents/notes/Work/index.norg
badd +21 Documents/notes/Notes/index.norg
badd +1 Documents/notes/Personal\ Development/index.norg
badd +1 Documents/notes/Youtube\ Videos/index.norg
badd +7 Documents/vimwiki/Apprentissage/index.wiki
badd +13 ~/Documents/notes/Vulkan.norg
badd +13 ~/Documents/notes/Wayland.norg
badd +1 ~/Documents/notes/IMGUI.norg
badd +4 ~/Documents/notes/Graphics\ Rendering.norg
badd +9 ~/Documents/notes/OS.norg
argglobal
%argdel
$argadd Documents/vimwiki/Apprentissage/index.wiki
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit Documents/notes/Apprentissage.norg
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
exe 'vert 1resize ' . ((&columns * 94 + 86) / 172)
exe 'vert 2resize ' . ((&columns * 77 + 86) / 172)
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
1
normal! zo
15
normal! zo
22
normal! zo
98
normal! zo
105
normal! zo
134
normal! zo
148
normal! zo
let s:l = 22 - ((21 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 22
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("Documents/notes/index.norg", ":p")) | buffer Documents/notes/index.norg | else | edit Documents/notes/index.norg | endif
if &buftype ==# 'terminal'
  silent file Documents/notes/index.norg
endif
balt Documents/notes/GTD.norg
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
62
normal! zo
62
normal! zc
89
normal! zo
94
normal! zo
89
normal! zc
124
normal! zo
151
normal! zo
let s:l = 147 - ((58 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 147
normal! 014|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 86) / 172)
exe 'vert 2resize ' . ((&columns * 77 + 86) / 172)
tabnext
edit Documents/notes/index.norg
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
exe 'vert 1resize ' . ((&columns * 85 + 86) / 172)
exe 'vert 2resize ' . ((&columns * 86 + 86) / 172)
argglobal
enew | setl bt=help
help neorg@en
balt Documents/notes/index.norg
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 436 - ((36 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 436
normal! 0
wincmd w
argglobal
balt Documents/notes/Youtube\ Videos/index.norg
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 93 - ((0 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 93
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 85 + 86) / 172)
exe 'vert 2resize ' . ((&columns * 86 + 86) / 172)
tabnext
edit Documents/notes/Apprentissage.norg
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
exe 'vert 1resize ' . ((&columns * 94 + 86) / 172)
exe 'vert 2resize ' . ((&columns * 77 + 86) / 172)
argglobal
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=4
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 84 - ((2 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 84
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("Documents/notes/Notes/index.norg", ":p")) | buffer Documents/notes/Notes/index.norg | else | edit Documents/notes/Notes/index.norg | endif
if &buftype ==# 'terminal'
  silent file Documents/notes/Notes/index.norg
endif
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
let s:l = 23 - ((22 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 23
normal! 03|
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 86) / 172)
exe 'vert 2resize ' . ((&columns * 77 + 86) / 172)
tabnext
edit Documents/vimwiki/para/Areas/fonctionnel.wiki
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
exe 'vert 1resize ' . ((&columns * 94 + 86) / 172)
exe 'vert 2resize ' . ((&columns * 77 + 86) / 172)
argglobal
balt Documents/vimwiki/para/Areas/Programmation.wiki
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
let s:l = 14 - ((13 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("Documents/vimwiki/para/Areas/Lambda\ Calculus.wiki", ":p")) | buffer Documents/vimwiki/para/Areas/Lambda\ Calculus.wiki | else | edit Documents/vimwiki/para/Areas/Lambda\ Calculus.wiki | endif
if &buftype ==# 'terminal'
  silent file Documents/vimwiki/para/Areas/Lambda\ Calculus.wiki
endif
balt Documents/vimwiki/para/Areas/Computer\ Science.wiki
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
let s:l = 13 - ((0 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 045|
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 86) / 172)
exe 'vert 2resize ' . ((&columns * 77 + 86) / 172)
tabnext 1
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
