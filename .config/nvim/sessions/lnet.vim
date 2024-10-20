let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/projects/lustre-release
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +229 lustre/mdt/mdt_mds.c
badd +101 lustre/include/uapi/linux/lustre/lustre_idl.h
badd +1 lnet/klnds
badd +44 lnet/klnds/o2iblnd/o2iblnd_cb.c
badd +3688 lnet/klnds/o2iblnd/o2iblnd.c
badd +1185 lnet/klnds/o2iblnd/o2iblnd.h
badd +1032 lustre/ptlrpc/niobuf.c
badd +1406 lustre/ptlrpc/pack_generic.c
badd +95 lnet/lnet/lib-me.c
badd +621 lnet/lnet/lib-ptl.c
badd +440 lnet/include/uapi/linux/lnet/lnet-types.h
badd +130 lnet/include/lnet/api.h
badd +781 lnet/include/lnet/lib-lnet.h
badd +231 lnet/include/lnet/lib-types.h
badd +671 lnet/lnet/api-ni.c
badd +523 lnet/lnet/lib-md.c
badd +4221 lnet/lnet/lib-move.c
badd +33 lnet/klnds/gnilnd/gnilnd.c
badd +386 lnet/klnds/kfilnd/kfilnd.c
badd +2126 lustre/include/lustre_net.h
badd +462 lustre/ptlrpc/service.c
badd +1194 lnet/lnet/lib-msg.c
badd +2323 lnet/klnds/gnilnd/gni_pub.h
badd +891 lustre/mdt/mdt_internal.h
badd +738 lustre/mgs/mgs_nids.c
badd +291 lustre/ofd/ofd_internal.h
badd +1844 /usr/include/yaml.h
badd +486 /usr/include/openssl/crypto.h
badd +2341 lnet/klnds/gnilnd/gnilnd_cb.c
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit lustre/include/uapi/linux/lustre/lustre_idl.h
argglobal
balt lustre/mdt/mdt_mds.c
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
let s:l = 101 - ((17 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 101
normal! 0
tabnext
edit lnet/klnds/o2iblnd/o2iblnd.c
argglobal
balt lnet/klnds/o2iblnd/o2iblnd.h
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
let s:l = 3009 - ((21 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3009
normal! 05|
lcd ~/dev/projects/lustre-release
tabnext
edit ~/dev/projects/lustre-release/lnet/include/lnet/lib-types.h
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
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
exe '1resize ' . ((&lines * 21 + 23) / 47)
exe '2resize ' . ((&lines * 22 + 23) / 47)
argglobal
balt ~/dev/projects/lustre-release/lnet/include/lnet/lib-lnet.h
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
let s:l = 204 - ((10 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 204
normal! 0
lcd ~/dev/projects/lustre-release
wincmd w
argglobal
if bufexists(fnamemodify("~/dev/projects/lustre-release/lnet/include/lnet/lib-types.h", ":p")) | buffer ~/dev/projects/lustre-release/lnet/include/lnet/lib-types.h | else | edit ~/dev/projects/lustre-release/lnet/include/lnet/lib-types.h | endif
if &buftype ==# 'terminal'
  silent file ~/dev/projects/lustre-release/lnet/include/lnet/lib-types.h
endif
balt ~/dev/projects/lustre-release/lnet/include/lnet/lib-lnet.h
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
let s:l = 1156 - ((10 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1156
normal! 08|
lcd ~/dev/projects/lustre-release
wincmd w
exe '1resize ' . ((&lines * 21 + 23) / 47)
exe '2resize ' . ((&lines * 22 + 23) / 47)
tabnext
edit ~/dev/projects/lustre-release/lnet/lnet/lib-move.c
argglobal
balt ~/dev/projects/lustre-release/lnet/include/lnet/api.h
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
let s:l = 741 - ((10 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 741
normal! 0
lcd ~/dev/projects/lustre-release
tabnext
edit ~/dev/projects/lustre-release/lnet/klnds/o2iblnd/o2iblnd_cb.c
argglobal
balt ~/dev/projects/lustre-release/lnet/klnds/o2iblnd/o2iblnd.h
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
let s:l = 2013 - ((21 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2013
normal! 016|
lcd ~/dev/projects/lustre-release
tabnext
edit ~/dev/projects/lustre-release/lnet/klnds/o2iblnd/o2iblnd_cb.c
argglobal
balt ~/dev/projects/lustre-release/lnet/klnds/o2iblnd/o2iblnd.h
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
let s:l = 1327 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1327
normal! 0
lcd ~/dev/projects/lustre-release
tabnext
edit ~/dev/projects/lustre-release/lnet/klnds/o2iblnd/o2iblnd.c
argglobal
balt ~/dev/projects/lustre-release/lnet/klnds/o2iblnd/o2iblnd.h
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
let s:l = 3289 - ((21 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3289
normal! 013|
lcd ~/dev/projects/lustre-release
tabnext
edit ~/dev/projects/lustre-release/lnet/include/uapi/linux/lnet/lnet-types.h
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
let s:l = 427 - ((40 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 427
normal! 0
lcd ~/dev/projects/lustre-release
tabnext
edit ~/dev/projects/lustre-release/lustre/ptlrpc/niobuf.c
argglobal
balt ~/dev/projects/lustre-release/lustre/ptlrpc/service.c
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
let s:l = 1032 - ((43 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1032
normal! 0
lcd ~/dev/projects/lustre-release
tabnext
edit ~/dev/projects/lustre-release/lnet/include/lnet/lib-types.h
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
let s:l = 649 - ((26 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 649
normal! 0
lcd ~/dev/projects/lustre-release
tabnext
edit ~/dev/projects/lustre-release/lnet/include/lnet/lib-types.h
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
let s:l = 306 - ((32 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 306
normal! 0
lcd ~/dev/projects/lustre-release
tabnext
edit ~/dev/projects/lustre-release/lnet/lnet/lib-move.c
argglobal
balt ~/dev/projects/lustre-release/lnet/lnet/lib-msg.c
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
let s:l = 3173 - ((29 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3173
normal! 0
lcd ~/dev/projects/lustre-release
tabnext 5
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
