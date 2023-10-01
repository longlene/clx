# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A small and easy to use console text editor"
HOMEPAGE="https://craigbarnes.gitlab.io/dte/"
SRC_URI="https://craigbarnes.gitlab.io/dist/dte/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-libs/ncurses[tinfo]
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	prefix=${D}/usr emake install
}
