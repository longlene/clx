# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic

DESCRIPTION="Philips LightFrame2 for X"
HOMEPAGE="http://xlightframe.sourceforge.net"
SRC_URI="mirror://sourceforge/xlightframe/xLightFrame.${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="virtual/x11"
RDEPEND="virtual/x11 sys-apps/gawk x11-apps/xwininfo"

S="${WORKDIR}/xLightFrame.${PV}"

src_compile() {
	# Configure is broken and doesn't add proper ldflags, add them here. 
	append-ldflags -L/usr/lib/ -lX11 -lXext -lXpm
	econf || die "could not configure"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die "install failed"
	dobin src/lfw.sh || die "could not copy lfw.sh"
	dosed "s:/usr/local:/usr:g" /usr/bin/lfw.sh || die "could not modify xlightframe path in lfw.sh"
	dodoc NEWS README TODO AUTHORS COPYING INSTALL
}
