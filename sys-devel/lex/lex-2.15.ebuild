# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="posix compatible lex utility"
HOMEPAGE="https://github.com/sabotage-linux/lex"
SRC_URI="https://github.com/sabotage-linux/lex/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CDDL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin lex
	dolib.a libl.a
	doman lex.1
	dodoc README
}
