# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Adds grep and shout slash commands to Pidgin"
HOMEPAGE="http://code.google.com/p/pidgin-cmds/"
SRC_URI="http://pidgin-cmds.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="net-im/pidgin"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	./autogen.sh
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc README NEWS || die "Documentation failed"
}
