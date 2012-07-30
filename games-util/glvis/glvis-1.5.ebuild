# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic multilib

MY_PV=${PV/./}

DESCRIPTION="PVS (Potentially Visible Set) builder specially designed to be used with OpenGL ports of the DOOM game engine."
HOMEPAGE="http://www.vavoom-engine.com/glvis.php"
SRC_URI="mirror://sourceforge/vavoom/${PN}${MY_PV}src.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-arch/unzip"

S="${WORKDIR}"

pkg_setup() {
		if use amd64 ; then
			if ! has_m32 ; then
				eerror "Your compiler seems to be unable to compile 32bit code."
				eerror "Make sure you compile gcc with:"
				echo
				eerror "    USE=multilib FEATURES=-sandbox"
				die "Cannot produce 32bit code"
			fi
			if has_multilib_profile ; then
				export ABI=x86
			else
				append-flags -m32
				append-ldflags -m32
			fi
fi
}

src_unpack() {
		unpack ${A} || die "unpack failed"

		cd ${S}/${PN}
		sed -i Makefile -e "s/^CFLAGS.*$/CFLAGS=${CFLAGS}/" || die "sed Makefile failed"
}

src_compile() {
		cd ${S}/${PN}
		emake
}

src_install() {
		dobin bin/glvis || die "installing the binary failed"
		
		dodoc glvis/glvis.txt
}
