# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Gournal is a note-taking application written for usage on Tablet-PCs"
HOMEPAGE="http://www.adebenham.com/gournal/"
SRC_URI="http://www.adebenham.com/debian/gournal_0.5.1-1.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-perl/gtk2-perl
	dev-perl/gtk2-gladexml
	dev-perl/gnome2-canvas
	dev-perl/gnome2-print
	dev-perl/Compress-Zlib
	dev-perl/XML-Mini"

src_compile()
{
	# Nothing to be done
	true
}

src_install()
{
	cd gournal

	dobin gournal
	dodir /usr/share/gournal
	dodoc CHANGES COPYING README TODO

	cp gournal.glade pixmaps/*.png ${D}/usr/share/gournal/ || die
}
