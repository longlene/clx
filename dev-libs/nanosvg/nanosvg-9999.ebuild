# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="Simple stupid SVG parser"
HOMEPAGE="https://github.com/memononen/nanosvg"
SRC_URI=""

EGIT_REPO_URI="https://github.com/memononen/nanosvg.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins src/nanosvg.h src/nanosvgrast.h
	dodoc README.md
}
