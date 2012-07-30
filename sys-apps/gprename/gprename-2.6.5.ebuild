# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2

DESCRIPTION="GPRename is a complete batch renamer for files and directories"
HOMEPAGE="http://gprename.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/perl
        sys-devel/gettext
        dev-perl/gtk2-perl
        dev-perl/glib-perl
        dev-perl/Locale-gettext
        dev-perl/libintl-perl"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
        sed -i -e 's:/usr/local:/usr:g' Makefile || die "Installation failed with sed!"
        sed -i -e 's:build/::g' Makefile || die "Installation failed with sed!"
        sed -i -e 's:/build::g' Makefile || die "Installation failed with sed!"
}

src_configure() {
        einfo "No configure needed"
}

src_install() {
        emake DESTDIR="${D}/usr/" install || die "emake install failed"
}

