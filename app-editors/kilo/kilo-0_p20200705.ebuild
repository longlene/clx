# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="69c3ce609d1e8df3956cba6db3d296a7cf3af3de"

DESCRIPTION="A text editor in less than 1000 LOC with syntax highlight and search"
HOMEPAGE="https://github.com/antirez/kilo"
SRC_URI="https://github.com/antirez/kilo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin kilo
	dodoc README.md
}
