LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libnl3
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

LOCAL_CFLAGS := \
    -D_BSD_SOURCE \
    -D_GNU_SOURCE \
    -Wall \
    -Wextra \
    -Wmissing-prototypes \
    -Wpointer-arith \
    -Wno-unused-parameter \
    -Wno-sign-compare \
    -Wno-missing-field-initializers \
    -Wno-sometimes-uninitialized \
    -DSYSCONFDIR="\"/system/etc/libnl\""

LOCAL_SRC_FILES := \
    lib/addr.c \
    lib/attr.c \
    lib/cache.c \
    lib/cache_mngr.c \
    lib/cache_mngt.c \
    lib/data.c \
    lib/error.c \
    lib/handlers.c \
    lib/hash.c \
    lib/hashtable.c \
    lib/mpls.c \
    lib/msg.c \
    lib/nl.c \
    lib/object.c \
    lib/socket.c \
    lib/utils.c \
    lib/version.c \

LOCAL_SRC_FILES += \
    lib/fib_lookup/lookup.c \
    lib/fib_lookup/request.c \
    lib/route/act.c \
    lib/route/act/gact.c \
    lib/route/act/mirred.c \
    lib/route/act/skbedit.c \
    lib/route/act/vlan.c \
    lib/route/addr.c \
    lib/route/class.c \
    lib/route/classid.c \
    lib/route/cls.c \
    lib/route/cls/basic.c \
    lib/route/cls/cgroup.c \
    lib/route/cls/ematch.c \
    lib/route/cls/ematch/cmp.c \
    lib/route/cls/ematch/container.c \
    lib/route/cls/ematch/meta.c \
    lib/route/cls/ematch/nbyte.c \
    lib/route/cls/ematch/text.c \
    lib/route/cls/fw.c \
    lib/route/cls/mall.c \
    lib/route/cls/police.c \
    lib/route/cls/u32.c \
    lib/route/link.c \
    lib/route/link/api.c \
    lib/route/link/bonding.c \
    lib/route/link/bridge.c \
    lib/route/link/can.c \
    lib/route/link/dummy.c \
    lib/route/link/geneve.c \
    lib/route/link/ifb.c \
    lib/route/link/inet.c \
    lib/route/link/inet6.c \
    lib/route/link/ip6tnl.c \
    lib/route/link/ipgre.c \
    lib/route/link/ipip.c \
    lib/route/link/ipvlan.c \
    lib/route/link/ipvti.c \
    lib/route/link/macsec.c \
    lib/route/link/macvlan.c \
    lib/route/link/ppp.c \
    lib/route/link/sit.c \
    lib/route/link/sriov.c \
    lib/route/link/veth.c \
    lib/route/link/vlan.c \
    lib/route/link/vrf.c \
    lib/route/link/vxlan.c \
    lib/route/neigh.c \
    lib/route/neightbl.c \
    lib/route/netconf.c \
    lib/route/nexthop.c \
    lib/route/nexthop_encap.c \
    lib/route/nh_encap_mpls.c \
    lib/route/pktloc.c \
    lib/route/qdisc.c \
    lib/route/qdisc/blackhole.c \
    lib/route/qdisc/cbq.c \
    lib/route/qdisc/dsmark.c \
    lib/route/qdisc/fifo.c \
    lib/route/qdisc/fq_codel.c \
    lib/route/qdisc/hfsc.c \
    lib/route/qdisc/htb.c \
    lib/route/qdisc/ingress.c \
    lib/route/qdisc/mqprio.c \
    lib/route/qdisc/netem.c \
    lib/route/qdisc/plug.c \
    lib/route/qdisc/prio.c \
    lib/route/qdisc/red.c \
    lib/route/qdisc/sfq.c \
    lib/route/qdisc/tbf.c \
    lib/route/route.c \
    lib/route/route_obj.c \
    lib/route/route_utils.c \
    lib/route/rtnl.c \
    lib/route/rule.c \
    lib/route/tc.c \

LOCAL_SRC_FILES += \
    lib/route/pktloc_syntax.y \
    lib/route/cls/ematch_syntax.y \

LOCAL_SRC_FILES += \
    lib/genl/ctrl.c \
    lib/genl/family.c \
    lib/genl/genl.c \
    lib/genl/mngt.c \

LOCAL_HEADER_LIBRARIES := generated_kernel_headers

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/lib \
    $(LOCAL_PATH)/include \
    $(LOCAL_PATH)/include/linux-private \

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include

intermediates := $(local-generated-sources-dir)

GEN := $(intermediates)/lib/route/pktloc_grammar.c
$(GEN): PRIVATE_CUSTOM_TOOL = $(AM_V_GEN) $(LEX) --header-file=$(@:%.c=%.h) -o $@ $<
$(GEN): $(LOCAL_PATH)/lib/route/pktloc_grammar.l
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

GEN := $(intermediates)/lib/route/cls/ematch_grammar.c
$(GEN): PRIVATE_CUSTOM_TOOL = $(AM_V_GEN) $(LEX) --header-file=$(@:%.c=%.h) -o $@ $<
$(GEN): $(LOCAL_PATH)/lib/route/cls/ematch_grammar.l
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

include $(BUILD_SHARED_LIBRARY)
