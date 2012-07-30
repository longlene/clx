# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit eutils flag-o-matic

DESCRIPTION="Video Related Picture Editor"
HOMEPAGE="http://vrpe.sytes.net/"
SRC_URI="http://vrpe.sytes.net/VRPE/VRPE-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2
	>=gnome-base/gnome-vfs-2
	net-dns/avahi"

DEPEND=${RDEPEND}

S=${WORKDIR}/VRPE

src_compile() {
	cd ${S}
	filter-flags -fomit-frame-pointer
	econf || die "configure failed"
	emake || die "make failed"
}
src_install() {

	cd ${S}
	make DESTDIR=${D} install || die "make install failed"
	dodoc ABOUT-NLS AUTHORS Changelog COPYING INSTALL NEWS README TODO
}

