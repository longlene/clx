# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""
DESCRIPTION="BIG and nice GM/GS soundfont"
HOMEPAGE="http://personalcopy.com/home.htm"
SRC_URI="ftp://ftp.personalcopy.net/pub/PC51f.sf2.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"

RDEPEND=""

DEPEND="app-admin/eselect-timidity"

RESTRICT=""

S=${WORKDIR}
MY_FONTNAME="PC51f.sf2"

src_install() {
	cd ${S}
	insinto /usr/share/timidity/personalcopy/
	doins ${MY_FONTNAME}
	doins ${FILESDIR}/timidity.cfg
}

pkg_postinst() {
	eselect timidity update --global --if-unset
}

