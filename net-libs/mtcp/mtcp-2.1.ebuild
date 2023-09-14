# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A Highly Scalable User-level TCP Stack for Multicore Systems"
HOMEPAGE="https://github.com/mtcp-stack/mtcp"
SRC_URI="https://github.com/mtcp-stack/mtcp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-libs/dpdk
"
RDEPEND="${DEPEND}"
BDEPEND=""
