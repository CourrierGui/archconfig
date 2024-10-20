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
badd +5636 lustre/llite/file.c
badd +1075 lustre/llite/llite_internal.h
badd +3241 lustre/llite/llite_lib.c
badd +926 lustre/llite/rw26.c
badd +1469 lustre/llite/rw.c
badd +1094 lustre/obdclass/cl_page.c
badd +936 lustre/include/cl_object.h
badd +220 lustre/osc/osc_page.c
badd +590 lustre/include/lustre_osc.h
badd +2545 lustre/osc/osc_cache.c
badd +270 ~/dev/projects/lustre-release/lustre/llite/vvp_internal.h
badd +1161 lustre/llite/vvp_io.c
badd +279 ~/dev/projects/lustre-release/lustre/include/lustre_req_layout.h
badd +1726 lustre/ptlrpc/layout.c
badd +1534 lustre/osc/osc_request.c
badd +1617 lustre/ptlrpc/nrs_tbf.c
badd +3655 lustre/mdt/mdt_handler.c
badd +2499 lustre/include/uapi/linux/lustre/lustre_idl.h
badd +1437 lustre/target/tgt_handler.c
badd +1009 lustre/llite/namei.c
badd +1464 lustre/include/obd_class.h
badd +563 lustre/lmv/lmv_intent.c
badd +1335 lustre/mdc/mdc_locks.c
badd +2480 lustre/ldlm/ldlm_request.c
badd +1214 lustre/mgs/mgs_handler.c
badd +1273 lustre/ptlrpc/lproc_ptlrpc.c
badd +1282 lustre/ldlm/ldlm_lockd.c
badd +205 lustre/mdt/mdt_mds.c
badd +984 lustre/mgc/mgc_request.c
badd +1611 lustre/obdclass/lprocfs_status.c
badd +1329 lustre/ptlrpc/client.c
badd +2375 lustre/ptlrpc/service.c
badd +299 lustre/ptlrpc/wiretest.c
badd +3048 lustre/utils/wirecheck.c
badd +325 lustre/utils/wiretest.c
badd +876 lustre/include/obd.h
badd +125 lustre/ldlm/ldlm_lock.c
badd +301 lustre/llite/dcache.c
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit lustre/target/tgt_handler.c
argglobal
balt lustre/mdt/mdt_handler.c
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
let s:l = 2577 - ((43 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2577
normal! 0
tabnext
edit lustre/ldlm/ldlm_request.c
argglobal
balt lustre/mdc/mdc_locks.c
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
let s:l = 943 - ((7 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 943
normal! 0
tabnext
edit lustre/ldlm/ldlm_lockd.c
argglobal
balt lustre/target/tgt_handler.c
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
let s:l = 1282 - ((19 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1282
normal! 0
tabnext
edit lustre/mdt/mdt_handler.c
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
exe '1resize ' . ((&lines * 33 + 23) / 47)
exe '2resize ' . ((&lines * 10 + 23) / 47)
argglobal
balt lustre/mdc/mdc_locks.c
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
let s:l = 4598 - ((13 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4598
normal! 039|
wincmd w
argglobal
enew
balt lustre/include/obd.h
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
exe '1resize ' . ((&lines * 33 + 23) / 47)
exe '2resize ' . ((&lines * 10 + 23) / 47)
tabnext 3
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
