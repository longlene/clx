# Copyright 2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A GUI for media-video/setpwc to control Philips (and compatible) webcams"
HOMEPAGE="http://gtksetpwc.spiderou.net"
SRC_URI="http://gtksetpwc.spiderou.net/files/${P}.tar.bz2"
LICENSE="CeCILL"
SLOT="0"
KEYWORDS="~x86"

IUSE=""

RDEPEND="media-video/setpwc
		dev-perl/gtk2-perl"

src_install() {
	cd ${WORKDIR}/${PN}
	exeinto /usr/bin
	doexe gtksetpwc.pl || die "install failed"
	dodoc INSTALL README
}
