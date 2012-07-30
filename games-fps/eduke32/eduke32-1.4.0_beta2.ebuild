# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DATE="20060718"
HRP_V="10"
HRP_FILE="hrp_xtr10.zip"
DEMO="3dduke13.zip"

DESCRIPTION="Port of Duke Nukem 3D for SDL"
HOMEPAGE="http://www.eduke32.com/
	http://hrp.duke4.net/"
SRC_URI="demo? (
		ftp://ftp.3drealms.com/share/${DEMO}
		ftp://ftp.planetmirror.com/pub/gameworld/downloads/${DEMO} )
	mirror://sourceforge/${PN}/${PN}_src_${DATE}.zip
	mirror://sourceforge/${PN}/txbuild_src_${DATE}.zip
	http://polymer.plagman.net/${HRP_FILE}
	http://moreplease.free.fr/HRP/${HRP_FILE}"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE="demo editor"

RDEPEND=">=media-libs/libsdl-1.2.9
	virtual/libstdc++
	>=x11-libs/gtk+-2.4.0"
DEPEND="${RDEPEND}
	dev-lang/nasm
	app-arch/unzip"

S=${WORKDIR}/duke3d
dir=${GAMES_DATADIR}/${PN}

src_unpack() {
	unpack ${A}

	local f fname lowerfname

	if use demo ; then
		unzip -qo DN3DSW13.SHR || die "unzip DN3DSW13.SHR failed"
	else
		# Look for registered version
		for f in "${FILESDIR}"/*.{CON,con,DMO,dmo,GRP,grp,RTS,rts} ; do
			if [[ -n $(ls -A "${f}" 2>/dev/null) ]] ; then
				cp "${f}" . || die
			fi
		done
	fi

	for f in *.{CON,con,DMO,dmo,GRP,grp,RTS,rts} ; do
		test -f "${f}" || continue
		fname=$(basename "${f}")
		# Lower-case, to avoid "TABLES.DAT" error
		lowerfname=$(echo "${fname}" | tr [:upper:] [:lower:])
		if [[ "${fname}" != "${lowerfname}" ]]; then
			mv -f "${fname}" "${lowerfname}" || die
		fi
	done

	# Directory names for compilation
	mv "eduke32_src_${DATE}" duke3d || die
	mv "txbuild_src_${DATE}" build || die

	cd "${S}" || die

	# Set directory
	sed -i source/game.c \
		-e "s:/usr/share/games/eduke32:${dir}:" \
		|| die "sed game.c failed"
}

src_compile() {
	emake -j1 || die "emake failed"
}

src_install() {
	newgamesbin ${PN} ${PN}.bin || die
	if use editor ; then
		dogamesbin mapster32 || die
	fi

	insinto "${dir}"
	doins {${PN},mapster32}.{map,sym} "${WORKDIR}"/duke3d_*.zip \
		|| die "doins failed"
	if [[ -f "${WORKDIR}"/duke3d.grp ]] ; then
		doins "${WORKDIR}"/*.{con,dmo,grp,rts} || die "doins data failed"
	fi
	if [[ -f "${WORKDIR}"/duke.rts ]] ; then
		# Make convenient symlink, because
		# is upper-case in ~/.eduke32/duke3d.cfg
		cd "${D}/${dir}" || die
		ln -sfn duke.rts DUKE.RTS || die
		cd "${S}" || die
	fi

	# Adds high-resolution textures.
	# Changes to game dir, to avoid leaving "eduke32.log" in current dir.
	games_make_wrapper ${PN} "${PN}.bin /gduke3d_xtr.zip" "${dir}"

	local title="EDuke32"
	use demo && title="${title} (Demo)"
	make_desktop_entry ${PN} "${title}"

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	ewarn "There is no audio:  http://forums.3drealms.com/vb/showthread.php?t=25815"
	ewarn "eduke32 is known to have problems with ATI cards."
	echo
}
