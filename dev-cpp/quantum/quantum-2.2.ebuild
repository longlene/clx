# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Powerful multi-threaded coroutine dispatcher and parallel execution engine"
HOMEPAGE="https://github.com/bloomberg/quantum"
SRC_URI="https://github.com/bloomberg/quantum/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/boost[context]
"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DQUANTUM_BOOST_STATIC_LIBS=OFF
	)
	cmake_src_configure
}
