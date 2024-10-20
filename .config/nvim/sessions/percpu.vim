let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/cea/linux
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +114 include/linux/percpu-defs.h
badd +245 arch/arm64/include/asm/percpu.h
badd +48 include/asm-generic/percpu.h
badd +944 arch/ia64/kernel/setup.c
badd +105 arch/loongarch/kernel/numa.c
badd +546 arch/mips/mm/init.c
badd +817 arch/powerpc/kernel/setup_64.c
badd +17 arch/sparc/include/asm/percpu_64.h
badd +419 arch/x86/entry/calling.h
badd +119 arch/x86/kernel/setup_percpu.c
badd +158 drivers/base/arch_numa.c
badd +2587 mm/percpu.c
badd +307 arch/arm/include/asm/assembler.h
badd +43 arch/arm/include/asm/percpu.h
badd +101 arch/ia64/mm/contig.c
badd +180 arch/ia64/mm/discontig.c
badd +257 arch/s390/kernel/smp.c
badd +1560 arch/sparc/kernel/smp_64.c
badd +282 arch/x86/kernel/hw_breakpoint.c
badd +2583 kernel/debug/kdb/kdb_main.c
badd +350 kernel/workqueue.c
badd +503 include/linux/workqueue.h
badd +29 arch/ia64/include/asm/percpu.h
badd +16 arch/mips/sgi-ip27/ip27-common.h
badd +0 arch/mips/sgi-ip27/ip27-init.c
badd +0 arch/mips/sgi-ip27/ip27-smp.c
badd +137 include/linux/percpu.h
badd +956 init/main.c
badd +96 include/linux/cpumask.h
badd +12 tools/include/linux/bitmap.h
badd +19 include/linux/bitops.h
badd +14 include/linux/bits.h
badd +33 include/uapi/linux/const.h
badd +65 arch/x86/include/asm/smp.h
badd +17 arch/arm/include/asm/mach/arch.h
badd +56 include/linux/idr.h
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit mm/percpu.c
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
balt kernel/debug/kdb/kdb_main.c
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
let s:l = 3429 - ((22 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3429
normal! 014|
wincmd w
argglobal
if bufexists(fnamemodify("arch/x86/kernel/setup_percpu.c", ":p")) | buffer arch/x86/kernel/setup_percpu.c | else | edit arch/x86/kernel/setup_percpu.c | endif
balt arch/x86/include/asm/smp.h
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
let s:l = 176 - ((5 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 176
normal! 09|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit drivers/base/arch_numa.c
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
balt arch/x86/kernel/setup_percpu.c
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
let s:l = 157 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 157
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("init/main.c", ":p")) | buffer init/main.c | else | edit init/main.c | endif
balt mm/percpu.c
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
let s:l = 929 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 929
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit include/linux/cpumask.h
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
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
exe '1resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
exe '3resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 3resize ' . ((&columns * 94 + 94) / 189)
exe '4resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 4resize ' . ((&columns * 94 + 94) / 189)
argglobal
balt init/main.c
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
let s:l = 41 - ((12 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 41
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("include/linux/cpumask.h", ":p")) | buffer include/linux/cpumask.h | else | edit include/linux/cpumask.h | endif
balt init/main.c
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
let s:l = 857 - ((0 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 857
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("include/linux/cpumask.h", ":p")) | buffer include/linux/cpumask.h | else | edit include/linux/cpumask.h | endif
balt tools/include/linux/bitmap.h
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
let s:l = 96 - ((12 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 96
normal! 015|
wincmd w
argglobal
if bufexists(fnamemodify("include/linux/cpumask.h", ":p")) | buffer include/linux/cpumask.h | else | edit include/linux/cpumask.h | endif
balt tools/include/linux/bitmap.h
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
let s:l = 173 - ((8 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 173
normal! 0
wincmd w
exe '1resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
exe '3resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 3resize ' . ((&columns * 94 + 94) / 189)
exe '4resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 4resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit include/linux/idr.h
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
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
exe '1resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
exe '3resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 3resize ' . ((&columns * 94 + 94) / 189)
exe '4resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 4resize ' . ((&columns * 94 + 94) / 189)
argglobal
balt kernel/workqueue.c
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
let s:l = 56 - ((12 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 56
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("include/linux/idr.h", ":p")) | buffer include/linux/idr.h | else | edit include/linux/idr.h | endif
balt kernel/workqueue.c
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
let s:l = 22 - ((10 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 22
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("kernel/workqueue.c", ":p")) | buffer kernel/workqueue.c | else | edit kernel/workqueue.c | endif
balt include/linux/idr.h
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
let s:l = 5995 - ((10 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5995
normal! 02|
wincmd w
argglobal
if bufexists(fnamemodify("kernel/workqueue.c", ":p")) | buffer kernel/workqueue.c | else | edit kernel/workqueue.c | endif
balt include/linux/idr.h
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
let s:l = 4211 - ((2 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4211
normal! 033|
wincmd w
exe '1resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
exe '3resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 3resize ' . ((&columns * 94 + 94) / 189)
exe '4resize ' . ((&lines * 22 + 24) / 48)
exe 'vert 4resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit mm/percpu.c
argglobal
balt include/linux/percpu.h
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
let s:l = 1722 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1722
normal! 0
tabnext 1
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
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
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
