# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="43793-mirage-${PV}"
ENGINE_SRC="mirage-engine-${PV}"
THEMES_SRC="mirage-themes-${PV}"
ENGINE_DEST="/usr"
THEMES_DEST="/usr/share/themes"

DESCRIPTION="Mirage gtk2 engine and themes"
HOMEPAGE="http://www.gnome-look.org/content/show.php?content=43793"
SRC_URI="http://www.gnome-look.org/CONTENT/content-files/${MY_P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.8"
RDEPEND="${DEPEND}
	x11-themes/gtk-engines-ubuntulooks
	x11-themes/gtk-engines-murrine"

S=${WORKDIR}/${ENGINE_SRC}

src_unpack() {
	unpack ${A}
	tar xzf ${ENGINE_SRC}.tar.gz
	tar xzf ${THEMES_SRC}.tar.gz
}

src_compile() {
	./autogen.sh --prefix=${ENGINE_DEST} || die "autogen.sh failed."
	make || die "make failed."
}

src_install() {
	make DESTDIR=${D} install || die "make install failed."
	mkdir -p ${D}${THEMES_DEST}
	mv ${WORKDIR}/Mirage ${D}${THEMES_DEST}
	mv ${WORKDIR}/Mirage\ Emerald ${D}${THEMES_DEST}
	mv ${WORKDIR}/Mirage\ Ruby ${D}${THEMES_DEST}
	mv ${WORKDIR}/Mirage\ Sapphire ${D}${THEMES_DEST}
	mv ${WORKDIR}/Mirage\ Topaz ${D}${THEMES_DEST}
}
