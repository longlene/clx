# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit vcs-snapshot

EGIT_COMMIT="dc12d90586a8ab99da0c575aafff999666aa5d55"

DESCRIPTION="Simple stupid SVG parser"
HOMEPAGE="https://github.com/memononen/nanosvg"
SRC_URI="https://github.com/memononen/nanosvg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins src/nanosvg.h
	dodoc README.md
}
