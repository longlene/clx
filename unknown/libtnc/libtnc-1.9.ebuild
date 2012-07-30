# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils toolchain-funcs

DESCRIPTION="An Portable Open Source UPnP Development Kit"
HOMEPAGE="http://libtnc.sourceforge.net/"
SRC_URI="mirror://sourceforge/libtnc/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

# RDEPEND="!net-misc/upnp"

src_compile() {
	# w/o docdir to avoid sandbox violations	
	econf \
		$(use_enable debug) \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install () {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS COPYING TODO NEWS README ChangeLog
}

