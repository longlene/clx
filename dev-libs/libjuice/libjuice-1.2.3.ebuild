# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="UDP Interactive Connectivity Establishment"
HOMEPAGE="https://github.com/paullouisageneau/libjuice"
SRC_URI="https://github.com/paullouisageneau/libjuice/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="nettle"

DEPEND="
	nettle? ( dev-libs/nettle )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "/DESTINATION/{s# lib\$# $(get_libdir)#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_NETTLE=$(usex nettle)
		-DNO_TESTS=ON
	)
	cmake_src_configure
}
