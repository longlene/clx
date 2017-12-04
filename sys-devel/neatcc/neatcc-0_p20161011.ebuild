# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="3b04b7f9afcda20ee7864724da4dd462229c17e9"

DESCRIPTION="A small C compiler"
HOMEPAGE="http://litcave.rudi.ir/"
SRC_URI="https://github.com/aligrudi/neatcc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ncc
	dodoc README
}
