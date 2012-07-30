# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lightweight and fullfeatured GTK+ UTF-8 Text Editor with Perl
embeded"
HOMEPAGE="http://cafe.sourceforge.net"
SRC_URI="mirror://sourceforge/cafe/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/glib-2.20.4
>=x11-libs/gtk+-2.16.1
>=x11-libs/gtksourceview-2.6.2
>=x11-libs/pango-1.22.1
>=net-libs/gnet-2.0.8
>=app-text/gtkspell-2.0.14
>=sys-devel/libperl-5.8.0"

src_compile() {
    econf --with-posix-regex
    emake || die "emake failed"
}

src_install() {
    emake DESTDIR="${D}" install || die "install failed"

    dodoc NEWS README || die
}
