# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit autotools eutils games

MY_PN=${PN}-7_50
DESCRIPTION="Fast-paced multiplayer deathmatch game"
HOMEPAGE="http://red.planetarena.org/"
SRC_URI="http://icculus.org/alienarena/Files/${MY_PN}-linux${PV}.tar.gz"

LICENSE="GPL-2 free-noncomm"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="dedicated"

UIRDEPEND="media-libs/jpeg
	media-libs/openal
	media-libs/libvorbis
	virtual/glu
	virtual/opengl
	dev-games/ode
	media-libs/freetype:2
	x11-libs/libXxf86dga
	x11-libs/libXxf86vm"
RDEPEND="!dedicated? ( ${UIRDEPEND} )
	net-misc/curl"
UIDEPEND="x11-proto/xf86dgaproto
	x11-proto/xf86vidmodeproto"
DEPEND="${RDEPEND}
	!dedicated? ( ${UIDEPEND} )
	dev-util/pkgconfig
	app-arch/unzip"

S=${WORKDIR}/${MY_PN/_/.}

src_prepare() {
	eautoreconf	
}

src_configure() {
	egamesconf \
		--docdir=/REMOVE_ME \
		$(use_enable !dedicated client) \
		$(use_with !dedicated x) \
		$(use_with !dedicated xf86vm) \
		$(use_with !dedicated xf86dga)
}

src_install() {
	emake DESTDIR="${D}" install || die
	newicon aa.png ${PN}.png
	make_desktop_entry crx "AlienArena 2011"
	
	rm -rf "${D}"/REMOVE_ME || die
	dodoc docs/README.txt || die
	prepgamesdirs
}
