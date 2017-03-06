# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="a8ee174c8cefe8781eb3453c7e1b3b9c22ae4213"

DESCRIPTION="Rapid DNS resolver"
HOMEPAGE="https://github.com/vstakhov/librdns"
SRC_URI="https://github.com/vstakhov/librdns/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.so ${BUILD_DIR}/librdns.so*
	use static && dolib.a ${BUILD_DIR}/librdns_static.a
	insinto /usr
	doins -r include
	dodoc README.md
}
