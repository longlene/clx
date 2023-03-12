# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Yet Another Socket IO service"
HOMEPAGE="https://github.com/simdsoft/yasio"
SRC_URI="
	https://github.com/yasio/yasio/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/yasio/thirdparty/archive/addc5585e8470e59b3ec16cfff56a1ae7011b19b.tar.gz -> thirdparty-addc5585e8470e59b3ec16cfff56a1ae7011b19b.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir thirdparty && ln -sv "${WORKDIR}"/thirdparty-addc5585e8470e59b3ec16cfff56a1ae7011b19b thirdparty
	cmake_src_prepare
}

#src_configure() {
#	local mycmakeargs=(
#	-DYASIO_BUILD_TESTS=OFF
#	)
#	cmake_src_configure
#}
#
#src_install() {
#	dolib.a ${BUILD_DIR}/libyasio.a
#	insinto /usr/include/yasio
#	doins yasio/*.hpp
#	dodoc README.md
#}
