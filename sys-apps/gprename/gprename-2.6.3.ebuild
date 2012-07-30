# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

inherit gnome2

EAPI=0

DESCRIPTION="GPRename is a complete batch renamer for files and directories"
HOMEPAGE="http://gprename.sourceforge.net/"

SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="dev-lang/perl
        dev-perl/gtk2-perl
        dev-perl/glib-perl
	sys-devel/gettext
	dev-perl/Locale-gettext
	dev-perl/libintl-perl"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	sed -i -e 's/\/usr\/local/\/usr\//g' Makefile || die "Installation failed with sed!"
	sed -i -e 's/build\///g' Makefile || die "Installation failed with sed!"
	sed -i -e 's/\/build//g' Makefile || die "Installation failed with sed!"
}

src_compile() {
	emake || die "Make failed"
}

src_install() {
	emake DESTDIR="${D}/usr/" install || die "emake install failed"
}

pkg_postinst() {
	gnome2_pkg_postinst

}
