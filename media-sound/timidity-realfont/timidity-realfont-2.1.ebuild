# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

IUSE=""
MY_PV="$(replace_all_version_separators _)"
DESCRIPTION="The Free professional Soundfont"
HOMEPAGE="http://pages.infinit.net/mikev/realfont.htm"
SRC_URI="ftp://ftp.personalcopy.net/pub/RealFont_${MY_PV}.sfArk"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"

RDEPEND=""

DEPEND="app-arch/sfarkxtc
	app-admin/eselect-timidity"

RESTRICT=""

S=${WORKDIR}
MY_FONTNAME="realfont.sf2"
src_unpack() {
	cd ${S}
	sfarkxtc ${DISTDIR}/${A} ${MY_FONTNAME} || die
	mv ${DISTDIR}/${MY_FONTNAME} ./
}

src_install() {
	cd ${S}
	insinto /usr/share/timidity/realfont/
	doins ${MY_FONTNAME}
	doins ${FILESDIR}/timidity.cfg
}

pkg_postinst() {
	eselect timidity update --global --if-unset
}

