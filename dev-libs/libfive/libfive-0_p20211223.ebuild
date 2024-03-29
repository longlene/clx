# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="b7f2baa5390082691cbd09d90170b9a72e369e3b"

DESCRIPTION="Infrastructure for solid modeling"
HOMEPAGE="https://github.com/libfive/libfive"
SRC_URI="https://github.com/libfive/libfive/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/eigen
	dev-libs/boost
	dev-qt/qtcore:5
	media-libs/libpng
"
RDEPEND="${DEPEND}"

src_install() {
	dolib.so ${BUILD_DIR}/libfive/src/libfive.so
	insinto /usr/include
	doins -r libfive/include/libfive{,.h}
}
