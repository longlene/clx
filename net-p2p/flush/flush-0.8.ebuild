# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/deluge/deluge-1.1.9.ebuild,v 1.5 2009/11/05 16:21:10 armin76 Exp $

EAPI="2"

inherit eutils distutils flag-o-matic

DESCRIPTION="BitTorrent client with a client/server model."
HOMEPAGE="http://sourceforge.net/projects/flush/"
SRC_URI="mirror://sourceforge/flush/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

RDEPEND=""
DEPEND=">=net-libs/rb_libtorrent-0.14.6
	>=dev-libs/libconfig-1.3.2
	>=sys-apps/dbus-1.2.3-r1"

src_compile() {
econf
emake || die “Make failed”
}

src_install() {
            emake install DESTDIR="${D}" || die "Install failed"
            dodoc AUTHORS ChangeLog || die "dodoc failed"
	    dobin "${FILESDIR}"/flush-start 
	    insinto /usr/share/applications
	    doins "${FILESDIR}"/flush.desktop
       }
