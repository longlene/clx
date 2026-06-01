# Copyright 2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="e3e44836c5f625b5532586ddce895f8b5e36a212"

DESCRIPTION="FlatBuffers Compiler and Library in C for C"
HOMEPAGE="https://github.com/dvidelabs/flatcc/"
SRC_URI="https://github.com/dvidelabs/flatcc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DFLATCC_TEST=OFF
		-DFLATCC_CXX_TEST=OFF
		-DFLATCC_INSTALL=ON
		-DFLATCC_INSTALL_LIB=$(get_libdir)
	)
	cmake_src_configure
}
