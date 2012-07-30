# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion games

DESCRIPTION="EDGE: the Enhanced Doom Game Engine"
HOMEPAGE="http://edge.sourceforge.net/"
ESVN_REPO_URI="https://edge.svn.sourceforge.net/svnroot/edge/trunk/edge"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=sys-libs/zlib-1.2.3
	>=media-libs/jpeg-6b
	>=media-libs/libpng-1.2.12
	>=media-libs/libogg-1.1.3
	>=media-libs/libvorbis-1.1.2
	>=media-libs/libsdl-1.2
	media-libs/sdl-net
	media-libs/glew
	virtual/opengl"
DEPEND="${RDEPEND}
	dev-util/scons
	>=games-util/glbsp-2.24"

PDEPEND=">=games-fps/edge-data-5.8"

dir="${GAMES_DATADIR}/${PN}"

src_unpack() {
	subversion_src_unpack
	cd "${S}"
	epatch "${FILESDIR}/SConstruct_fixes.patch"
	# Get rid of provided glbsp sources
	rm -fr glbsp
}

src_compile() {
	scons -c
	scons || die "scons failed"
}

src_install() {
	exeinto "${dir}"
	doexe "gl${PN}32" || die "doexe failed"

	# SVN version requires up-to-date DDF data files
	insinto "${dir}"
	doins -r data || die "doins ddf data failed"

	games_make_wrapper ${PN} "./gl${PN}32 -ddf data/doom" "${dir}" || die "make_wrapper failed"

	dodoc README || die "dodoc failed"
	docinto changelogs
	dodoc docs/changelogs/* || die "dodoc failed"
	docinto tech
	dodoc docs/tech/* || die "dodoc failed"
	docinto log
	dodoc log/* || die "dodoc failed"

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog "Copy or link wad files into ${dir}"
	elog "(the files must be readable by the 'games' group)."
	elog
	elog "Example setup:"
	elog "ln -sn ${GAMES_DATADIR}/doom-data/doom.wad ${dir}/"
	elog
	elog "Example command-line:"
	elog "   ${PN} -windowed -iwad doom.wad"
	elog
	elog "See documentation for further details."
}
