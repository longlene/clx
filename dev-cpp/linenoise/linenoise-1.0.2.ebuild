# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="A small self-contained alternative to readline and libedit"
HOMEPAGE="https://github.com/taktoa/linenoise"
SRC_URI="mirror://github/taktoa/linenoise/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins src/linenoise.hpp
	dolib.a ${CMAKE_BUILD_DIR}/liblinenoise.a
	dodoc README.md
}
