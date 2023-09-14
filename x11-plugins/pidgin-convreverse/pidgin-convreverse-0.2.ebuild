# Copyright 2007 Angelo "sYdRo" D'Autilia
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Pidgin plugin that reverses any word on all conversation. "
HOMEPAGE="https://sourceforge.net/projects/convreverse/"
SRC_URI="mirror://sourceforge/convreverse/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RDEPEND="=net-im/pidgin-2*"

src_compile() {
 cd ${PN}
 econf || die "Configuration fail"
 emake || die "Make fail"
}

src_install() {
 cd ${PN}
 emake install DESTDIR=${D}
 dodoc AUTHORS ChangeLog COPYING INSTALL
 prepallstrip
}


