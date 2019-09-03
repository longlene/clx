# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Lexbor is development of an open source HTML Renderer library"
HOMEPAGE="https://lexbor.com"
SRC_URI="https://github.com/lexbor/lexbor/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DLEXBOR_WITHOUT_THREADS=OFF
	-DLEXBOR_BUILD_TESTS_CPP=OFF
	)
	cmake-utils_src_configure
}
