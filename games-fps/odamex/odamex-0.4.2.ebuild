# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs wxwidgets games

MY_P="${PN}-src-${PV}"
DESCRIPTION="Free and Open Source multiplayer Doom engine"
HOMEPAGE="http://odamex.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dedicated wxwindows"

DEPEND=">=media-libs/libsdl-1.2.9
	>=media-libs/sdl-mixer-1.2.6
	wxwindows? ( =x11-libs/wxGTK-2.8* )"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
inst_dir="${GAMES_DATADIR}/${PN}"

src_unpack() {
	unpack "${A}"
	cd "${S}"

	# Set user CFLAGS
	    sed -i \
			-e "/^CFLAGS \=/s/-g -Wall -O2/${CFLAGS}/" \
			Makefile || die "sed Makefile failed"
}

src_compile() {
	local target="client master"
	use dedicated && target="${target} server"

	for obj in ${target}
	do
		einfo "Building ${obj} ..."

		emake \
			CC="$(tc-getCXX)" \
			LD="$(tc-getCXX)" \
			"${obj}" \
			|| die "emake failed"
	done

	if use wxwindows; then
		export WX_GTK_VER=2.8
		need-wxwidgets gtk2
		einfo "Building launcher ..."
		emake -C odalaunch \
			WXCONFIG="${WX_CONFIG}" \
			CC="$(tc-getCXX)" \
			LD="$(tc-getCXX)" \
			|| die "emake odalaunch failed"
	fi
}

src_install() {
	local \
		ct=0 \
		target="${PN} odamaster" \
		descr=( "Odamex" "" )

	if use dedicated ; then
		target="${target} odasrv"
		descr=( "${descr[@]}" "Odamex Server" )
	fi

	if use wxwindows ; then
		target="${target} odalaunch"
		descr=( "${descr[@]}" "Odamex Launcher" )
	fi

	insinto "${inst_dir}"
	doins "${PN}.wad"

	exeinto "${inst_dir}"
	for obj in ${target}
	do
		local source=${obj}
		[[ ${obj} == "odalaunch" ]] && source="odalaunch/odalaunch"
		doexe "${source}" || die "doexe ${obj} failed"
		games_make_wrapper ${obj} "./${obj}" "${inst_dir}"
		[[ ${obj} != "odamaster" ]] && newicon "media/icon_${obj}_128.png" "${obj}.png"
		[[ ${obj} != "odamaster" ]] && make_desktop_entry "${obj}" "${descr[${ct}]}" "${obj}.png"
		let "ct++"
	done

	dodoc CHANGELOG MAINTAINERS README || die "dodoc failed"

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst
	elog "Copy or link wad files into ${inst_dir}"
	elog "(the files must be readable by the 'games' group)."
	elog
	elog "Example setup:"
	elog "ln -sn ${GAMES_DATADIR}/doom-data/doom.wad ${inst_dir}/"
	elog
	elog "or set the \"DOOMWADDIR\" environment variable to the path"
	elog "where such files are located (e.g. declaring it in your .bashrc)"
	elog
	elog "Example:"
	elog
	elog "DOOMWADDIR=\"/usr/local/games/mywads\" odamex"
	elog
	if use wxwindows ; then
		elog
		elog "You've also installed a nice graphical launcher. Simply run:"
		elog
		elog "   odalaunch"
		elog
		elog "to enjoy it :)"
	fi
}
