# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Yet Another Socket IO service"
HOMEPAGE="https://github.com/simdsoft/yasio"
SRC_URI="https://github.com/simdsoft/yasio/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DYASIO_BUILD_TESTS=OFF
	)
	cmake-utils_src_configure
}

src_install() {
	dolib.a ${BUILD_DIR}/libyasio.a
	insinto /usr/include/yasio
	doins yasio/*.hpp
	dodoc README.md
}
