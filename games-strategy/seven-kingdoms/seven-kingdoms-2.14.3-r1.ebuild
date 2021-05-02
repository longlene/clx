# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit autotools games

MY_P="7kaa-${PV}"
MY_DATA_DIR="7kaa"
MY_DATA="${MY_DATA_DIR}-data-2.13.tar.bz2"
DESCRIPTION="Seven Kingdoms: Ancient Adversaries game from Enlight, now released with the GPL license."
HOMEPAGE="http://7kfans.com/"
SRC_URI="mirror://sourceforge/skfans/7kaa-source-${PV}.tar.bz2
         mirror://sourceforge/skfans/${MY_DATA}"
RESTRICT="mirror"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
  >sys-devel/gcc-4.0
  sys-devel/autoconf
	media-gfx/icoutils"
RDEPEND="
  =media-libs/libsdl-1.2*
  =media-libs/sdl-net-1.2*
  media-libs/openal"

S=${WORKDIR}/${MY_P}

DOCS=( COPYING README )

src_prepare() {
	eautoreconf
	# Note: what about game data?
}

src_configure() {
	egamesconf
	egamesconf \
  	--without-directx \
		--without-wine \
		--program-suffix=".bin" \
		--datadir="${GAMES_DATADIR}/${MY_DATA_DIR}"
}

src_install() {
	local MY_TGT="${GAMES_DATADIR}/${MY_DATA_DIR}"

	emake DESTDIR="${D}" install || die 'emake install failed.'
	dodoc ${DOCS[@]} || die 'dodoc failed.'

	# We have to manually install the game data:
	dodir "${MY_TGT}"
	for dir in $(find "${WORKDIR}/${MY_DATA_DIR}" -mindepth 1 -maxdepth 1 -type d) ; do
		echo -n "copying ${dir}"
		cp -r "${dir}" "${D}${MY_TGT}"/ || die " ... failed"
		echo " done"
	done

	icotool -x ${S}/src/client/7k.ico -o ${S}/7kaa.png
	doicon "${S}/7kaa.png"

	games_make_wrapper 7kaa "${GAMES_BINDIR}/7kaa.bin" "${MY_TGT}"
	make_desktop_entry 7kaa "Seven Kingdoms" 7kaa "Game;StrategyGame" "Path=${MY_TGT}" 

	prepgamesdirs
}

pkg_postinst() {
	elog "What you will NOT find in this archive"
	elog "---------"
	elog "* The original game music. These files cannot be distributed as Enlight"
	elog "  does not own the copyright. This includes the music directory and the"
	elog "  intro video."
	elog "* The original translations resource file. This file was created by third"
	elog "  party distributors and Enlight does not have the right to distribute it."
	elog "  This will be replaced by the 7kfans project."
	elog "* Any other content from original game CDs, including the version 2.12b"
	elog "  game binary or older. This also includes the I*Magic Online service."
	echo
	elog "Please do not upload missing content from the original game to the"
	elog "internet. It is very nice that Enlight has provided the game under the"
	elog "GPL, but this does not allow you to now violate the rights of other"
	elog "copyright owners."
	echo
	elog "If you really do want to get the music from the original game, you can"
	elog "still buy Seven Kingdoms for $6 at GoG.com."
	echo
	games_pkg_postinst
}
