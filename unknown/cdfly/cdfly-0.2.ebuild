# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils qt4

DESCRIPTION="The Cross-Platform CD Collection Manager"
HOMEPAGE="http://cdfly.sourceforge.net/"
SRC_URI="mirror://sourceforge/cdfly/${PN}-${PV}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"

RDEPEND="${DEPEND}"

DEPEND="$(qt_min_version 4)"

pkg_setup() {
    if ! built_with_use x11-libs/qt sqlite ; then
	echo
        eerror "Please enable 'sqlite' in USE flags for qt4."
        die "x11-libs/qt is missing the sqlite flag."
    fi
}

src_unpack() {
	unpack ${A}
}

src_compile() {
	cd ${S}
	qmake
	make || die "make failed"
}

src_install() {
	dobin cdfly
	doicon cdfly.png
	# Translations
	mkdir ${D}/usr/share/cdfly
	cp *.qm ${D}/usr/share/cdfly
	# Desktop entry
	make_desktop_entry cdfly "CdFly" cdfly.png Utility;
}
