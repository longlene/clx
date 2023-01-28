# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Network Benchmarking Utility"
HOMEPAGE="https://github.com/Mellanox/sockperf"
SRC_URI="https://github.com/Mellanox/sockperf/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
