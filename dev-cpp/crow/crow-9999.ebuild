# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="Crow is very fast and easy to use C++ micro web framework"
HOMEPAGE="https://github.com/ipkn/crow"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ipkn/crow.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/boost
dev-util/google-perftools
"

src_install() {
	insinto /usr/include
	doins amalgamate/crow_all.h
	dodoc README.md
}
