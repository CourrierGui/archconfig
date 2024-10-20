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
badd +147 include/rdma/rdma_cm.h
badd +77 include/uapi/rdma/rdma_user_cm.h
badd +77 /usr/include/rdma/rdma_user_cm.h
badd +4102 drivers/infiniband/core/cma.c
badd +36 include/uapi/linux/netlink.h
badd +9 tools/include/uapi/linux/netlink.h
badd +9 /usr/include/linux/netlink.h
badd +516 crypto/crypto_user_base.c
badd +317 drivers/infiniband/core/netlink.c
badd +66 net/core/rtnetlink.c
badd +1315 net/ipv4/inet_diag.c
badd +3742 net/netfilter/nf_conntrack_netlink.c
badd +8007 net/netfilter/nf_tables_api.c
badd +282 net/netfilter/nfnetlink_acct.c
badd +630 net/netfilter/nfnetlink_cthelper.c
badd +272 net/netfilter/nfnetlink_cttimeout.c
badd +352 net/netfilter/nfnetlink_hook.c
badd +250 net/netlink/diag.c
badd +1304 net/netlink/genetlink.c
badd +238 net/packet/diag.c
badd +240 net/smc/smc_diag.c
badd +85 net/tipc/diag.c
badd +311 net/unix/diag.c
badd +149 net/vmw_vsock/diag.c
badd +187 net/xdp/xsk_diag.c
badd +600 net/xfrm/xfrm_compat.c
badd +2897 net/xfrm/xfrm_user.c
badd +477 samples/bpf/xdp_router_ipv4_user.c
badd +113 tools/bpf/bpftool/net.c
badd +54 tools/lib/bpf/netlink.c
badd +299 tools/lib/thermal/commands.c
badd +662 tools/testing/selftests/nci/nci_dev.c
badd +2322 tools/testing/selftests/net/ipsec.c
badd +1117 tools/testing/selftests/net/mptcp/pm_nl_ctl.c
badd +176 tools/testing/vsock/vsock_diag_test.c
badd +62 include/linux/netlink.h
badd +1289 net/netlink/af_netlink.c
badd +202 include/linux/socket.h
badd +202 tools/perf/trace/beauty/include/linux/socket.h
badd +95 tools/testing/selftests/net/tap.c
badd +111 /usr/include/bits/socket.h
badd +77 tools/testing/selftests/net/tun.c
badd +373 tools/testing/selftests/net/udpgso.c
badd +1 net/core/sock_diag.c
badd +90 include/net/scm.h
badd +203 net/core/scm.c
badd +346 arch/x86/include/asm/bitops.h
badd +3865 security/security.c
badd +2420 net/core/skbuff.c
badd +997 include/net/sock.h
badd +3545 include/linux/skbuff.h
badd +61 include/asm-generic/rwonce.h
badd +69 drivers/infiniband/hw/erdma/erdma_cm.h
badd +63 drivers/infiniband/sw/siw/siw_cm.h
badd +168 fs/dlm/lowcomms.c
badd +1 drivers/infiniband/hw/erdma/erdma_cm.c
badd +2577 net/core/sock.c
badd +1921 net/smc/af_smc.c
badd +355 net/smc/smc_cdc.c
badd +1008 net/smc/smc_core.c
badd +512 net/smc/smc_rx.c
badd +1271 net/core/net_namespace.c
badd +413 include/net/net_namespace.h
badd +945 include/net/netlink.h
badd +221 scripts/clang-tools/gen_compile_commands.py
badd +5 include/linux/byteorder/big_endian.h
badd +14 include/uapi/linux/byteorder/big_endian.h
badd +133 /usr/include/linux/swab.h
badd +48 include/linux/stddef.h
badd +28 include/uapi/linux/stddef.h
badd +958 net/ipv4/ip_output.c
badd +2031 drivers/net/veth.c
badd +498 include/linux/jump_label.h
badd +673 include/linux/slab.h
badd +1046 mm/slab_common.c
badd +2579 include/linux/netdevice.h
badd +188 tools/include/linux/compiler.h
badd +24 include/uapi/linux/if_packet.h
badd +1 include/linux/if_ether.h
badd +385 net/core/dev.c
badd +560 drivers/infiniband/core/device.c
badd +0 drivers/net/ipvlan/ipvlan_main.c
badd +6407 drivers/net/bonding/bond_main.c
badd +0 drivers/net/ppp/ppp_generic.c
badd +0 net/8021q/vlan.c
badd +0 net/bridge/br_if.c
badd +0 net/ipv6/ip6_gre.c
badd +0 net/ipv6/ip6_tunnel.c
badd +0 net/ipv6/ip6_vti.c
badd +0 net/ipv6/sit.c
badd +892 drivers/net/bonding/bond_netlink.c
badd +55 include/net/rtnetlink.h
badd +192 include/uapi/linux/rtnetlink.h
badd +106 include/linux/rtnetlink.h
badd +648 include/linux/rcupdate.h
badd +765 include/linux/fortify-string.h
badd +300 include/uapi/linux/if_link.h
badd +33 include/uapi/linux/if.h
badd +706 lib/nlattr.c
badd +29 security/selinux/nlmsgtab.c
badd +28 /usr/include/linux/rtnetlink.h
badd +1 net/decnet/dn_dev.c
badd +946 net/ipv4/devinet.c
badd +161 include/linux/inetdevice.h
badd +1735 drivers/net/wireless/realtek/rtw88/pci.c
badd +1941 include/linux/pci.h
badd +2075 drivers/net/wireless/realtek/rtw88/main.h
badd +2202 drivers/net/wireless/realtek/rtw88/main.c
badd +1727 drivers/pci/pci-driver.c
badd +254 drivers/base/driver.c
badd +639 drivers/base/bus.c
badd +0 Documentation/driver-api/driver-model/porting.rst
badd +156 drivers/base/base.h
badd +1235 drivers/base/dd.c
badd +1166 include/linux/device.h
badd +1 net/8021q/vlan.h
badd +136 net/8021q/vlan_netlink.c
badd +1 net/devlink/netlink.c
badd +1571 net/socket.c
badd +25 include/uapi/linux/net.h
badd +231 include/linux/net.h
badd +1 fs/cifs/connect.c
badd +1055 net/9p/trans_fd.c
badd +859 include/linux/filter.h
badd +997 drivers/net/wwan/wwan_core.c
badd +140 net/bridge/br.c
badd +449 net/bridge/br_cfm.c
badd +331 net/bridge/br_ioctl.c
badd +567 net/bridge/br_mrp_netlink.c
badd +1890 net/bridge/br_netlink.c
badd +463 net/bridge/br_stp.c
badd +110 net/bridge/br_stp_if.c
badd +98 net/bridge/br_stp_timer.c
badd +351 net/bridge/br_sysfs_if.c
badd +40 include/net/netns/generic.h
badd +24 include/linux/kmod.h
badd +132 kernel/module/kmod.c
badd +1157 security/selinux/hooks.c
badd +254 drivers/connector/connector.c
badd +119 drivers/scsi/scsi_netlink.c
badd +5003 drivers/scsi/scsi_transport_iscsi.c
badd +84 drivers/staging/gdm724x/netlink_k.c
badd +1640 kernel/audit.c
badd +640 lib/kobject_uevent.c
badd +124 drivers/net/ppp/pppox.c
badd +1096 net/dccp/ipv4.c
badd +1176 net/dccp/ipv6.c
badd +294 net/ipv4/af_inet.c
badd +161 net/ipv6/af_inet6.c
badd +77 net/phonet/af_phonet.c
badd +1731 net/sctp/protocol.c
badd +25 net/netlink/af_netlink.h
badd +315 net/core/datagram.c
badd +0 drivers/infiniband/ulp/ipoib/ipoib_netlink.c
badd +0 drivers/net/amt.c
badd +0 drivers/net/bareudp.c
badd +0 drivers/net/can/dev/netlink.c
badd +0 drivers/net/can/vxcan.c
badd +0 drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
badd +0 drivers/net/geneve.c
badd +0 drivers/net/gtp.c
badd +0 drivers/net/macsec.c
badd +0 drivers/net/macvlan.c
badd +0 drivers/net/vrf.c
badd +0 drivers/net/vxlan/vxlan_core.c
badd +0 drivers/net/wireless/virt_wifi.c
badd +0 net/hsr/hsr_netlink.c
badd +0 net/ieee802154/6lowpan/core.c
badd +0 net/ipv4/ip_gre.c
badd +0 net/ipv4/ip_vti.c
badd +0 net/ipv4/ipip.c
badd +0 net/xfrm/xfrm_interface.c
badd +0 drivers/net/ipvlan/ipvtap.c
badd +0 drivers/net/macvtap.c
badd +0 drivers/net/wwan/iosm/iosm_ipc_wwan.c
badd +0 drivers/net/wwan/mhi_wwan_mbim.c
badd +0 drivers/net/wwan/t7xx/t7xx_netdev.c
badd +0 include/linux/wwan.h
badd +0 net/batman-adv/soft-interface.c
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
edit net/core/sock.c
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
let s:l = 4113 - ((41 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4113
normal! 09|
tabnext
edit include/linux/netdevice.h
argglobal
balt net/core/dev.c
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
let s:l = 2056 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2056
normal! 0
tabnext
edit include/linux/skbuff.h
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
let s:l = 842 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 842
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("include/linux/skbuff.h", ":p")) | buffer include/linux/skbuff.h | else | edit include/linux/skbuff.h | endif
balt net/core/skbuff.c
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
let s:l = 338 - ((2 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 338
normal! 09|
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit include/uapi/linux/if_packet.h
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
balt include/linux/if_ether.h
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
let s:l = 24 - ((21 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 24
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("net/core/dev.c", ":p")) | buffer net/core/dev.c | else | edit net/core/dev.c | endif
balt include/linux/skbuff.h
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
let s:l = 5136 - ((30 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5136
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit include/linux/skbuff.h
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
balt net/core/skbuff.c
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
let s:l = 2003 - ((28 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2003
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("include/linux/skbuff.h", ":p")) | buffer include/linux/skbuff.h | else | edit include/linux/skbuff.h | endif
balt net/core/skbuff.c
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
let s:l = 1296 - ((20 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1296
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit drivers/base/bus.c
argglobal
balt drivers/pci/pci-driver.c
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
let s:l = 31 - ((30 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 31
normal! 0
tabnext
edit Documentation/driver-api/driver-model/porting.rst
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
balt net/ipv4/inet_diag.c
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
let s:l = 1 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("net/netlink/diag.c", ":p")) | buffer net/netlink/diag.c | else | edit net/netlink/diag.c | endif
balt net/core/sock_diag.c
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
let s:l = 250 - ((32 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 250
normal! 030|
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit net/core/skbuff.c
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
balt scripts/clang-tools/gen_compile_commands.py
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
let s:l = 4834 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4834
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("net/core/skbuff.c", ":p")) | buffer net/core/skbuff.c | else | edit net/core/skbuff.c | endif
balt scripts/clang-tools/gen_compile_commands.py
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
let s:l = 448 - ((21 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 448
normal! 015|
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit include/linux/byteorder/big_endian.h
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
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 3resize ' . ((&columns * 94 + 94) / 189)
argglobal
balt net/core/skbuff.c
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
let s:l = 5 - ((4 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("arch/x86/include/asm", ":p")) | buffer arch/x86/include/asm | else | edit arch/x86/include/asm | endif
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
let s:l = 8 - ((7 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 0
lcd ~/dev/cea/linux
wincmd w
argglobal
if bufexists(fnamemodify("/usr/include/linux/swab.h", ":p")) | buffer /usr/include/linux/swab.h | else | edit /usr/include/linux/swab.h | endif
balt ~/dev/cea/linux/scripts/clang-tools/gen_compile_commands.py
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
let s:l = 133 - ((21 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 133
normal! 09|
wincmd w
exe '1resize ' . ((&lines * 21 + 23) / 47)
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe '2resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 3resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit ~/dev/cea/linux/include/linux/skbuff.h
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
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
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe '2resize ' . ((&lines * 21 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
exe '3resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 3resize ' . ((&columns * 94 + 94) / 189)
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
let s:l = 2740 - ((21 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2740
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/dev/cea/linux/include/linux/skbuff.h", ":p")) | buffer ~/dev/cea/linux/include/linux/skbuff.h | else | edit ~/dev/cea/linux/include/linux/skbuff.h | endif
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
let s:l = 1886 - ((11 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1886
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/dev/cea/linux/include/linux/skbuff.h", ":p")) | buffer ~/dev/cea/linux/include/linux/skbuff.h | else | edit ~/dev/cea/linux/include/linux/skbuff.h | endif
balt ~/dev/cea/linux/net/core/skbuff.c
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
let s:l = 1280 - ((7 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1280
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe '2resize ' . ((&lines * 21 + 23) / 47)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
exe '3resize ' . ((&lines * 22 + 23) / 47)
exe 'vert 3resize ' . ((&columns * 94 + 94) / 189)
tabnext
edit ~/dev/cea/linux/net/core/skbuff.c
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
balt ~/dev/cea/linux/include/linux/skbuff.h
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
let s:l = 698 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 698
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/dev/cea/linux/net/core/skbuff.c", ":p")) | buffer ~/dev/cea/linux/net/core/skbuff.c | else | edit ~/dev/cea/linux/net/core/skbuff.c | endif
balt ~/dev/cea/linux/include/linux/skbuff.h
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
let s:l = 621 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 621
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 94) / 189)
exe 'vert 2resize ' . ((&columns * 94 + 94) / 189)
tabnext 7
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
