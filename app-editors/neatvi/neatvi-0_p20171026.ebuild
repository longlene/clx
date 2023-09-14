# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="896da02715d68d3031e31e3862ac249e4ce4e645"

DESCRIPTION="A small ex/vi editor"
HOMEPAGE="http://litcave.rudi.ir"
SRC_URI="https://github.com/aligrudi/neatvi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/bin
	newins vi neatvi
	dodoc README
}
