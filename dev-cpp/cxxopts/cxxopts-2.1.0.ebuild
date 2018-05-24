# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Lightweight C++ command line option parser"
HOMEPAGE="https://github.com/jarro2783/cxxopts"
SRC_URI="https://github.com/jarro2783/cxxopts/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DCXXOPTS_BUILD_EXAMPLES=OFF
	)
	cmake-utils_src_configure
}

#src_install() {
#	insinto /usr/include
#	doins src/cxxopts.hpp
#	dodoc README.md
#}
