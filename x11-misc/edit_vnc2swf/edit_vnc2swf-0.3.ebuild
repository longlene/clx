# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

DESCRIPTION="A Tool to manipulate svf files."
HOMEPAGE="http://www.unixuser.org/~euske/vnc2swf/edit_vnc2swf.html"
SRC_URI="http://www.unixuser.org/~euske/vnc2swf/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RDEPEND=">=dev-lang/python-2.3
        >=dev-python/pygame-1.6"

src_install() {
		cd ${S} || die
		mv edit_vnc2swf.py edit_vnc2swf || die
		mv edit_mp3.py edit_mp3 || die
		dobin edit_vnc2swf || die
		dobin edit_mp3 || die
		dodoc LICENSE.TXT README.html
		}
