# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="Efficient RPCs for datacenter networks"
HOMEPAGE="https://erpc.io/"
SRC_URI="https://github.com/erpc-io/eRPC/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	sys-cluster/rdma-core
	net-libs/dpdk
"
RDEPEND="${DEPEND}"
BDEPEND=""
