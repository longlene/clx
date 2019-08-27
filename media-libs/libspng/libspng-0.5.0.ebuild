# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Simple, modern libpng alternative"
HOMEPAGE="https://libspng.org/"
SRC_URI="https://github.com/randy408/libspng/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

DEPEND="
	sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/install/{s#tests/libspng.pc#libspng.pc#}' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DSPNG_STATIC=$(usex static-libs)
	)
	cmake-utils_src_configure
}
