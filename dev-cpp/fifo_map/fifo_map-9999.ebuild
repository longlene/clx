# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="a FIFO-ordered associative container for C++"
HOMEPAGE="https://github.com/nlohmann/fifo_map"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nlohmann/fifo_map.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins src/fifo_map.hpp
	dodoc README.md
}
