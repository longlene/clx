# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils toolchain-funcs

DESCRIPTION="a gaming framework and library"
HOMEPAGE="http://source.musgit.com/"
SRC_URI="http://source.musgit.com/files/${PN}_${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~ppc ~x86"
IUSE=""

RDEPEND="media-libs/libsdl
	media-libs/mesa
	media-libs/openal
	media-libs/libogg
	dev-libs/expat
	media-libs/sdl-image"
DEPEND="${RDEPEND}
	dev-util/scons"

S=${WORKDIR}/${PN}_${PV}

src_prepare(){
	epatch ${FILESDIR}/"${PN}_${PV}-gcc4.patch"
	epatch ${FILESDIR}/"${PN}_${PV}-pnghack.patch"
}

src_compile() {
	scons dist=1 || die
}

src_install() {
	dodoc readme.txt
	libdir=$(get_libdir)
	dodir /usr/${libdir}
	insinto /usr/${libdir}
	doins dist/linux/lib/* || die
	insinto /usr/include/
	doins -r dist/linux/include/* || die
}
