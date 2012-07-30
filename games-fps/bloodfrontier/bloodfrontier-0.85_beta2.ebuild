# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils multilib games flag-o-matic

DESCRIPTION="free single/multi-player shooter game, built as a total conversion of Cube Engine 2"
HOMEPAGE="http://www.bloodfrontier.com"
SRC_URI="mirror://sourceforge/${PN}/${PN}-B2-linux.tar.bz2"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="server"

DEPEND="media-libs/libpng
		media-libs/libsdl[opengl]
		media-libs/sdl-mixer
		media-libs/sdl-image[png]"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}/src
DIR="${GAMES_DATADIR}"/${PN}

src_prepare() {
	# Ignore the CXXFLAGS the developers of this want to enforce.
	sed -i -e '1,4d' Makefile || die
}

src_compile() {
	use amd64 && multilib_toolchain_setup x86

	append-flags -fsigned-char
	emake || die "emake failed"
}

src_install() {
	exeinto "${DIR}"
	doexe bfclient || die "doexe failed"

	insinto "${DIR}"
	doins -r ../data || die "doins failed"

	games_make_wrapper bloodfrontier-client "./bfclient -r" "${DIR}" "${DIR}"

	if use server ; then
		doexe bfserver || die "doexe failed"
		games_make_wrapper bloodfrontier-server ./bfserver "${DIR}" "${DIR}"
	fi

	make_desktop_entry bloodfrontier-client "Blood Frontier" ${PN} || \
	die "make_desktop_entry failed"

	prepgamesdirs
}
