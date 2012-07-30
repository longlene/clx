# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
inherit autotools

DESCRIPTION="creates normal/height maps from high resolution meshes for games or 3d applications"
HOMEPAGE="http://epsylon.rptd.dnsalias.net/denormgen.php"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=x11-libs/fox-1.2"
DEPEND=">=x11-libs/fox-1.2"

src_unpack(){
	unpack ${A}
	cd ${S}
	eautoreconf
}

src_install(){
	emake DESTDIR=${D} install || die "emake failed"
	#insinto /usr/lib/blender/scripts
	insinto /usr/share/${P}/scripts
	doins scripts/dragengine_dim_export.py
	dodoc AUTHORS ChangeLog README TODO
}
