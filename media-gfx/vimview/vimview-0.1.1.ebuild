# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="An image viewer designed with viewing images from digital cameras. Small, lightweight and blazing fast (Imlib2 based). Vim like keybindings. Currently uses Gtk+"
HOMEPAGE="http://code.google.com/p/vimview/"
SRC_URI="http://vimview.googlecode.com/files/${P}.tbz2"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=x11-libs/gtk+-2 media-libs/imlib2 media-libs/libexif"
RDEPEND="$DEPEND"

src_compile()
{
	cd src && make NO_DEBUG=1 || die
}

src_install()
{
	dobin src/vimview || die
	dodoc README
}
