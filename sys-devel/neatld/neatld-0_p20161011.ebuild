# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="fb5d9f808717083e9be5cab996c0fa3fcb6f2622"

DESCRIPTION="A simple static linker"
HOMEPAGE="http://litcave.rudi.ir/"
SRC_URI="https://github.com/aligrudi/neatld/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin nld
}
