let SessionLoad = 1
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
badd +729 kernel/fork.c
badd +45 arch/alpha/mm/init.c
badd +303 include/linux/gfp.h
badd +124 /usr/include/linux/perf_event.h
badd +85 arch/alpha/mm/fault.c
badd +534 include/linux/mm.h
badd +5774 mm/memory.c
badd +0 mm/mmap.c
badd +498 Documentation/filesystems/locking.rst
badd +394 include/linux/fs.h
badd +940 arch/x86/kernel/uprobes.c
badd +4936 arch/x86/kvm/mmu/mmu.c
badd +268 arch/x86/mm/kmmio.c
badd +177 arch/x86/kvm/mmu/mmu_internal.h
badd +3 arch/x86/mm/fault.c
badd +2196 mm/gup.c
badd +80 mm/hmm.c
badd +4628 mm/hugetlb.c
badd +401 mm/ksm.c
badd +814 include/linux/mm_types.h
badd +496 include/linux/slab.h
badd +1033 mm/kfence/core.c
badd +280 mm/kfence/kfence_test.c
badd +866 mm/kmemleak.c
badd +2741 mm/mempolicy.c
badd +512 mm/mempool.c
badd +1355 mm/nommu.c
badd +141 mm/rmap.c
badd +3282 mm/slab.c
badd +532 mm/slab_common.c
badd +705 ~/dev/cea/linux/mm/slab.h
badd +328 include/linux/kexec.h
badd +148 arch/sh/kernel/relocate_kernel.S
badd +1062 mm/swapfile.c
badd +57 include/linux/frontswap.h
badd +366 include/linux/iomap.h
badd +486 include/linux/swap.h
badd +83 include/linux/swapops.h
badd +956 include/linux/mmzone.h
badd +4538 mm/vmscan.c
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
tabrewind
edit mm/memory.c
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
exe 'vert 1resize ' . ((&columns * 83 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 83 + 94) / 189)
argglobal
balt mm/ksm.c
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
let s:l = 4613 - ((8 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4613
normal! 019|
wincmd w
argglobal
if bufexists(fnamemodify("arch/x86/mm/fault.c", ":p")) | buffer arch/x86/mm/fault.c | else | edit arch/x86/mm/fault.c | endif
if &buftype ==# 'terminal'
  silent file arch/x86/mm/fault.c
endif
balt arch/x86/kvm/mmu/mmu_internal.h
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
let s:l = 1397 - ((8 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1397
normal! 013|
wincmd w
exe '1resize ' . ((&lines * 21 + 23) / 47)
exe 'vert 1resize ' . ((&columns * 83 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 83 + 94) / 189)
tabnext
edit mm/mmap.c
argglobal
balt arch/alpha/mm/fault.c
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
let s:l = 2252 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2252
normal! 0
tabnext
edit mm/memory.c
argglobal
balt include/linux/mm.h
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
let s:l = 5149 - ((32 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5149
normal! 0
tabnext
edit include/linux/mm.h
argglobal
balt include/linux/mm_types.h
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
let s:l = 534 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 534
normal! 02|
tabnext
edit include/linux/slab.h
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
exe 'vert 1resize ' . ((&columns * 83 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 83 + 94) / 189)
argglobal
balt include/linux/mm.h
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
let s:l = 723 - ((10 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 723
normal! 012|
wincmd w
argglobal
if bufexists(fnamemodify("mm/kfence/core.c", ":p")) | buffer mm/kfence/core.c | else | edit mm/kfence/core.c | endif
if &buftype ==# 'terminal'
  silent file mm/kfence/core.c
endif
balt mm/slab.c
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
let s:l = 1033 - ((9 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1033
normal! 09|
wincmd w
exe '1resize ' . ((&lines * 21 + 23) / 47)
exe 'vert 1resize ' . ((&columns * 83 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 83 + 94) / 189)
tabnext
edit include/linux/swap.h
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
exe 'vert 1resize ' . ((&columns * 83 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 83 + 94) / 189)
argglobal
balt include/linux/iomap.h
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
let s:l = 272 - ((4 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 272
normal! 08|
wincmd w
argglobal
if bufexists(fnamemodify("include/linux/fs.h", ":p")) | buffer include/linux/fs.h | else | edit include/linux/fs.h | endif
if &buftype ==# 'terminal'
  silent file include/linux/fs.h
endif
balt mm/swapfile.c
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
let s:l = 397 - ((19 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 397
normal! 033|
wincmd w
exe '1resize ' . ((&lines * 21 + 23) / 47)
exe 'vert 1resize ' . ((&columns * 83 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 83 + 94) / 189)
tabnext
edit include/linux/mm_types.h
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
exe 'vert 1resize ' . ((&columns * 83 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 83 + 94) / 189)
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
let s:l = 814 - ((7 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 814
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("include/linux/swapops.h", ":p")) | buffer include/linux/swapops.h | else | edit include/linux/swapops.h | endif
if &buftype ==# 'terminal'
  silent file include/linux/swapops.h
endif
balt include/linux/mm_types.h
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
let s:l = 83 - ((16 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 83
normal! 0
wincmd w
exe '1resize ' . ((&lines * 21 + 23) / 47)
exe 'vert 1resize ' . ((&columns * 83 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 83 + 94) / 189)
tabnext
edit mm/swapfile.c
argglobal
balt include/linux/swap.h
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
let s:l = 1062 - ((19 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1062
normal! 014|
tabnext
edit mm/vmscan.c
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
exe '1resize ' . ((&lines * 17 + 23) / 47)
exe '2resize ' . ((&lines * 26 + 23) / 47)
argglobal
balt include/linux/mmzone.h
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
let s:l = 4538 - ((12 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4538
normal! 09|
wincmd w
argglobal
if bufexists(fnamemodify("arch/x86/kvm/mmu/mmu.c", ":p")) | buffer arch/x86/kvm/mmu/mmu.c | else | edit arch/x86/kvm/mmu/mmu.c | endif
if &buftype ==# 'terminal'
  silent file arch/x86/kvm/mmu/mmu.c
endif
balt mm/vmscan.c
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
let s:l = 4928 - ((2 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4928
normal! 013|
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 17 + 23) / 47)
exe '2resize ' . ((&lines * 26 + 23) / 47)
tabnext
edit mm/memory.c
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
let s:l = 4942 - ((21 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4942
normal! 0
tabnext
edit include/linux/fs.h
argglobal
balt Documentation/filesystems/locking.rst
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
let s:l = 2115 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2115
normal! 0
tabnext 9
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
