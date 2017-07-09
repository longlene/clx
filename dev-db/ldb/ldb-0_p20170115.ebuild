# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="6809fb281e738aacf6a48aa62bd5c4945f00b272"

DESCRIPTION="A C++ REPL / CLI for LevelDB"
HOMEPAGE="https://github.com/0x00A/ldb"
SRC_URI="https://github.com/0x00A/ldb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/leveldb
"
RDEPEND="${DEPEND}"

src_compile() {
	LIBLEVELDB=-lleveldb emake ldb
}

src_install() {
	dobin ldb
	dodoc Makefile
}
