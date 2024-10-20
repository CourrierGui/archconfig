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
badd +876 lustre/ldlm/ldlm_lockd.c
badd +2570 lustre/ptlrpc/client.c
badd +2230 lustre/ptlrpc/layout.c
badd +623 lustre/include/uapi/linux/lustre/lustre_idl.h
badd +1 lustre/include/lustre_dlm_flags.h
badd +103 lustre/ptlrpc/lproc_ptlrpc.c
badd +503 lustre/target/tgt_handler.c
badd +2205 lustre/ldlm/ldlm_lock.c
badd +1646 lustre/ptlrpc/pack_generic.c
badd +1705 lustre/include/lustre_net.h
badd +6444 lustre/mdt/mdt_handler.c
badd +1019 lustre/ptlrpc/niobuf.c
badd +351 lnet/include/uapi/linux/lnet/lnet-types.h
badd +359 lustre/ptlrpc/gss/gss_cli_upcall.c
badd +3002 lustre/mdc/mdc_request.c
badd +3357 lustre/osc/osc_request.c
badd +1744 lustre/osp/osp_dev.c
badd +120 ~/dev/projects/lustre-release/lustre/mdc/mdc_internal.h
badd +49 lustre/mdc/mdc_reint.c
badd +568 libcfs/include/libcfs/linux/linux-wait.h
badd +744 lustre/mdt/mdt_coordinator.c
badd +1052 ~/dev/projects/lustre-release/lustre/mdt/mdt_internal.h
badd +572 lustre/mdt/mdt_hsm_cdt_agent.c
badd +434 lustre/include/lu_target.h
badd +499 lustre/target/tgt_main.c
badd +2060 lustre/target/tgt_lastrcvd.c
badd +101 lustre/target/tgt_internal.h
badd +304 lustre/mdt/mdt_mds.c
badd +1381 lustre/mgs/mgs_handler.c
badd +649 lustre/ofd/ofd_dev.c
badd +325 lustre/ost/ost_handler.c
badd +2721 lustre/ptlrpc/service.c
badd +90 ~/dev/projects/lustre-release/lustre/include/lustre_lib.h
badd +3249 lustre/ldlm/ldlm_lib.c
badd +1566 lustre/lfsck/lfsck_engine.c
badd +6697 lustre/lfsck/lfsck_layout.c
badd +507 lustre/ptlrpc/events.c
badd +66 lustre/ptlrpc/ptlrpc_internal.h
badd +980 lnet/include/lnet/lib-lnet.h
badd +192 lnet/include/lnet/lib-types.h
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
tabrewind
edit lustre/ldlm/ldlm_lockd.c
argglobal
balt lustre/ptlrpc/client.c
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
let s:l = 987 - ((29 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 987
normal! 020|
tabnext
edit lustre/ptlrpc/layout.c
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
let s:l = 2230 - ((25 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2230
normal! 0
tabnext
edit lustre/ptlrpc/client.c
argglobal
balt lustre/mdc/mdc_reint.c
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
let s:l = 3163 - ((12 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3163
normal! 0
tabnext
edit lustre/ptlrpc/client.c
argglobal
balt libcfs/include/libcfs/linux/linux-wait.h
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
let s:l = 2570 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2570
normal! 018|
tabnext
edit lustre/ptlrpc/pack_generic.c
argglobal
balt lustre/mdt/mdt_hsm_cdt_agent.c
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
let s:l = 1649 - ((24 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1649
normal! 0
tabnext
edit lustre/ptlrpc/service.c
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
let s:l = 2316 - ((20 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2316
normal! 012|
tabnext
edit lustre/ptlrpc/niobuf.c
argglobal
balt lustre/ldlm/ldlm_lib.c
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
let s:l = 58 - ((11 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 58
normal! 0
tabnext
edit lustre/ptlrpc/service.c
argglobal
balt lustre/include/lustre_net.h
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
let s:l = 3223 - ((21 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3223
normal! 038|
tabnext
edit lnet/include/uapi/linux/lnet/lnet-types.h
argglobal
balt lnet/include/lnet/lib-types.h
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
let s:l = 609 - ((17 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 609
normal! 0
tabnext
edit lustre/include/lustre_net.h
argglobal
balt lustre/ptlrpc/client.c
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
let s:l = 1139 - ((20 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1139
normal! 034|
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
