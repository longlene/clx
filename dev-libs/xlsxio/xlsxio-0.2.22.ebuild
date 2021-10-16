# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="Cross-platform C library for reading values from and writing values to .xlsx files"
HOMEPAGE="https://github.com/brechtsanders/xlsxio"
SRC_URI="https://github.com/brechtsanders/xlsxio/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc example static-libs tools"

DEPEND="
	dev-libs/libzip
	dev-libs/expat
	doc? ( app-doc/doxygen )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DBUILD_STATIC=$(usex static-libs)
	-DBUILD_TOOLS=$(usex tools)
	-DBUILD_EXAMPLES=$(usex example)
	)
	cmake_src_configure
}
