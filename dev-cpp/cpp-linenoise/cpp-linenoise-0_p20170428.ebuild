# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="d9c243f9f115ebfd7636b7ffa0f17c8e449847cb"

DESCRIPTION="Multi-platform (Unix, Windows) C++ header-only linenoise-based readline library"
HOMEPAGE="https://github.com/yhirose/cpp-linenoise"
SRC_URI="https://github.com/yhirose/cpp-linenoise/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins linenoise.hpp
	dodoc README.md
}
