# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://svn.sourceforge.net/svnroot/xreal/trunk/xreal"

inherit games
inherit subversion

DESCRIPTION="The highly advanced id Tech 3 engine and free indie game
project"
HOMEPAGE="http://www.xreal-project.net/"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="openal curl radiant xmap"
RESTRICT=""

RDEPEND=">=media-libs/libsdl-1.2
		 >=media-libs/freetype-2.3.5
		 openal?  ( >=media-libs/openal-0.0.8 )
		 curl?    ( >=net-misc/curl-7.15.5 )
		 radiant? ( >=x11-libs/gtk+-2.4.0
		 		    >=x11-libs/gtkglext-1.0.0
				    >=dev-libs/libxml2-2.0.0
				    >=sys-libs/zlib-1.2.0
				    >=media-libs/glew-1.5.0
				    >=dev-libs/boost-1.3.5
				  )
		 xmap?    ( >=dev-libs/libxml2-2.0.0
		 		    >=sys-libs/zlib-1.2.0
				  )"
DEPEND="dev-util/scons"

src_unpack() {
	subversion_src_unpack
}

src_compile() {
	local opts
	use x86 && opts="${opts} arch=linux-i386"
	use amd64 && opts="${opts} arch=linux-x86_64"
	use openal  && opts="${opts} openal=1"
	use curl    && opts="${opts} curl=compile"
	use radiant && opts="${opts} radiant=1"
	use xmap    && opts="${opts} xmap=1"
	opts="${opts} mapping=1"

	scons \
		${opts} \
		sharepath="${GAMES_DATADIR}/${PN}" \
		|| die "scons failed"
}

src_install() {
	local binary
	local xmap_bin
	local xmap2_bin
	local ext

	use x86 && ext=".x86"
	use amd64 && ext=".x86_64"

	binary="${PN}${ext}"
	xmap_bin="xmap${ext}"
	xmap2_bin="xmap2${ext}"

	newgamesbin ${binary} ${PN} || die "newgamesbin ${binary} ${PN} failed"
	newgamesbin ${xmap_bin} ${xmap_bin} || die "newgamesbin ${xmap_bin}
	${xmap_bin} failed"
	newgamesbin ${xmap2_bin} ${xmap2_bin} || die "newgamesbin ${xmap2_bin}
	${xmap2_bin} failed"

	insinto "${GAMES_DATADIR}/${PN}/base"
	doins -r base/* || die "doins failed"

	prepgamesdirs
}
