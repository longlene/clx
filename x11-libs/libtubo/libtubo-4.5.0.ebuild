# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A small and simple interprocess communication library"
HOMEPAGE="http://xffm.sourceforge.net/libtubo.html"
SRC_URI="http://downloads.sourceforge.net/xffm/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=" >=dev-libs/glib-2.6.0 "
RDEPEND=""

src_install() {
	emake DESTDIR=${D} install || die "emake install failed!"
}
