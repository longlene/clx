# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils linux-info user

DESCRIPTION="Yet another Linux container management system"
HOMEPAGE="https://github.com/yandex/porto"
SRC_URI="https://github.com/yandex/porto/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="
	dev-libs/libnl
	dev-libs/protobuf
	doc? ( app-text/pandoc )
"
RDEPEND="${DEPEND}"

CONFIG_CHECK="
	~MEMCG
	~FAIR_GROUP_SCHED
	~CFS_BANDWIDTH
	~CGROUP_FREEZER
	~CGROUP_DEVICE
	~CGROUP_CPUACCT
	~PID_NS
	~NET_NS
	~IPC_NS
	~UTS_NS
	~IPV6
"

#	~CGROUP_PIDS
#	~BLK_CGROUP
#	~RT_GROUP_SCHED
#	~CPUSETS
#	~CGROUP_HUGETLB
#	~HUGETLBFS
#	~OVERLAY_FS
#	~SQUASHFS
#	~BLK_DEV_LOOP
#	~BLK_DEV_DM
#	~DM_THIN_PROVISIONING
#	~VETH
#	~TUN
#	~MACVLAN
#	~IPVLAN
#	~NET_SCH_HFSC
#	~NET_SCH_SFQ
#	~NET_SCH_FQ_CODEL
#	~NET_SCH_INGRESS
#	~NET_ACT_POLICE
#	~IPV6_TUNNEL


pkg_setup() {
	linux-info_pkg_setup
	enewgroup porto
}

src_prepare() {
	eapply_user
	sed -e '/find_library/{s#libprotobuf.a#libprotobuf.so#}' \
		-e '/set/{/test/d}' \
		-i CMakeLists.txt
	use doc || sed '/add_custom_target(man/,$d' -i src/CMakeLists.txt
}
