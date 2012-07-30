# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils cmake-utils

DESCRIPTION="2D game development framework"
HOMEPAGE="http://sourceforge.net/projects/tuxcap"
SRC_URI="mirror://sourceforge/tuxcap/${P}.tar.gz"

LICENSE="TUXCAP"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="virtual/opengl
	x11-libs/libX11
	x11-libs/libXext
	media-libs/libsdl
	virtual/glu
	media-gfx/imagemagick
	media-libs/sdl-mixer"
DEPEND="${RDEPEND}
	dev-util/cmake"

src_prepare(){
	sed -i "s:SUBDIRS( \${MY_DIRS} ):SUBDIRS( lib ):" \
		tuxcap/CMakeLists.txt || die "sed failed"
}
