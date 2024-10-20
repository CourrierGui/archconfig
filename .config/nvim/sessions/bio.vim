let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/linux/arch-build/linux/src/archlinux-linux
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 drivers/nvme/host
badd +317 drivers/nvme/host/tcp.c
argglobal
%argdel
$argadd drivers/nvme/host
edit drivers/nvme/host/tcp.c
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
let s:l = 2533 - ((3 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2533
normal! 032|
lcd ~/dev/linux/arch-build/linux/src/archlinux-linux
wincmd w
argglobal
if bufexists(fnamemodify("~/dev/linux/arch-build/linux/src/archlinux-linux/drivers/nvme/host/tcp.c", ":p")) | buffer ~/dev/linux/arch-build/linux/src/archlinux-linux/drivers/nvme/host/tcp.c | else | edit ~/dev/linux/arch-build/linux/src/archlinux-linux/drivers/nvme/host/tcp.c | endif
if &buftype ==# 'terminal'
  silent file ~/dev/linux/arch-build/linux/src/archlinux-linux/drivers/nvme/host/tcp.c
endif
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
let s:l = 2489 - ((22 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2489
normal! 012|
lcd ~/dev/linux/arch-build/linux/src/archlinux-linux
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
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
