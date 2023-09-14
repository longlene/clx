# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

SRC_URI="http://termit.googlecode.com/files/${P}.tar.bz2"
HOMEPAGE="http://code.google.com/p/termit/"
DESCRIPTION="Simple terminal emulator based on vte library"

RDEPEND="x11-libs/vte
    >=x11-libs/gtk+-2.10"
DEPEND="${RDEPEND}
        >=dev-util/cmake-2.4"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE=""

DOCS="doc/README ChangeLog doc/session.example doc/termit.example"

CMAKE_IN_SOURCE_BUILD="yes"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	sed -i -e 's/ADD_SUBDIRECTORY(doc)//' CMakeLists.txt
}

pkg_postinst() {
	einfo
	einfo "There is a example of configfile in "
	einfo "		/usr/share/doc/${PF}/termit.example "
	einfo "copy this file to "
	einfo "		\$HOME/.config/termit/termit.cfg"
	einfo "and modify to fit your needs "
	einfo
}

