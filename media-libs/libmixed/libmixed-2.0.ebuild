# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="A low-level audio mixer pipeline library"
HOMEPAGE="https://github.com/Shirakumo/libmixed"
SRC_URI="https://github.com/Shirakumo/libmixed/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-sound/mpg123
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i "/install/{s#/usr/local/lib#/usr/$(get_libdir)#}" CMakeLists.txt
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_EXAMPLES=OFF
		-DBUILD_TESTER=OFF
	)
	cmake-utils_src_configure
}
	
src_install() {
	cmake-utils_src_install
	insinto /usr/include
	doins src/{encoding,mixed}.h
}
