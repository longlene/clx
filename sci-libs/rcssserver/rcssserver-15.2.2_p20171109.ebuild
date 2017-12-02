# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="fbe5093edea18e35c4cc8290aee84441dd8b7f06"

DESCRIPTION="RoboCup 2D Soccer Server"
HOMEPAGE="https://github.com/mhauskn/rcssserver"
SRC_URI="https://github.com/mhauskn/rcssserver/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/boost
	sys-devel/flex
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_install() {
	dobin ${BUILD_DIR}/bin/rcssserver
	insinto /usr/include/rcssserver
	doins src/*.h
	dolib.a ${BUILD_DIR}/lib/*.a
	dodoc README.md
}
