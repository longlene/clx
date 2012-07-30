# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/smplayer/smplayer-0.6.9.ebuild,v 1.1 2010/02/24 16:39:28 yngwin Exp $

EAPI="2"

inherit qt4-r2

MY_PN="GLC_lib"

SRC_URI="mirror://sourceforge/${PN}/${MY_PN}_src_${PV}.zip"

DESCRIPTION="OpenGL Library Class"
HOMEPAGE="http://www.glc-lib.net/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="x11-libs/qt-opengl:4
	sys-libs/zlib"

RDEPEND="${DEPEND}"

S="${WORKDIR}/glc_lib"

src_prepare() {
	epatch "${FILESDIR}/${PN}-2.1.0-install_path.patch"
}