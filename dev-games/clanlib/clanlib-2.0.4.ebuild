# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-games/clanlib/clanlib-0.8.1.ebuild,v 1.5 2009/08/04 21:24:39 mr_bones_ Exp $

EAPI=2
inherit flag-o-matic eutils

DESCRIPTION="multi-platform game development library"
HOMEPAGE="http://www.clanlib.org/"
SRC_URI="http://clanlib.org/download/releases-${PV:0:3}/ClanLib-${PV}.tgz"

LICENSE="ZLIB"
SLOT="0.8"
KEYWORDS="amd64 x86"
IUSE="opengl sdl vorbis doc mikmod ipv6"

# opengl keyword does not drop the GL/GLU requirement.
# Autoconf files need to be fixed
RDEPEND="media-libs/libpng
	media-libs/jpeg
	virtual/opengl
	virtual/glu
	sdl? (
		media-libs/libsdl
		media-libs/sdl-gfx
	)
	x11-libs/libXt
	x11-libs/libXmu
	x11-libs/libXxf86vm
	media-libs/alsa-lib
	mikmod? ( media-libs/libmikmod )
	vorbis? ( media-libs/libvorbis )"
DEPEND="${RDEPEND}
	x11-proto/xf86vidmodeproto"

S=${WORKDIR}/ClanLib-${PV}

src_configure() {
	#clanSound only controls mikmod/vorbis so there's
	# no need to pass --{en,dis}able-clanSound ...
	#clanDisplay only controls X, SDL, OpenGL plugins
	# so no need to pass --{en,dis}able-clanDisplay
	# also same reason why we don't have to use clanGUI
	econf \
		--enable-dyn \
		--enable-clanNetwork \
		--disable-dependency-tracking \
		$(use_enable x86 asm386) \
		$(use_enable doc docs) \
		$(use_enable opengl clanGL) \
		$(use_enable sdl clanSDL) \
		$(use_enable vorbis clanVorbis) \
		$(use_enable mikmod clanMikMod) \
		$(use_enable ipv6 getaddr)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	if use doc ; then
		dodir /usr/share/doc/${PF}/html
		mv "${D}"/usr/share/doc/clanlib-2.0/* "${D}"/usr/share/doc/${PF}/html/ || die
		rm -rf "${D}"/usr/share/doc/clanlib-2.0
		cp -r Examples Resources "${D}"/usr/share/doc/${PF}/ || die
	fi
	dodoc CODING_STYLE CREDITS PATCHES README* INSTALL.linux
}
