# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

GCONF_DEBUG="no"
MY_PN="ICON-Crystal-SVG"
S=${WORKDIR}/${MY_PN}-${PV}

inherit gnome2

DESCRIPTION="Crystal SVG Icons for GNOME"
HOMEPAGE="http://art.gnome.org/themes/icon/569"
SRC_URI="http://ftp.gnome.org/pub/GNOME/teams/art.gnome.org/archive/themes/icon/${MY_PN}-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND=""
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	rm -f *.{theme~,xml~}
}

src_compile() {
	einfo "Nothing to compile, installing..."
}

src_install() {
	insinto /usr/share/icons/crystalsvg
	doins -r "${S}"/*
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}