# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
inherit eutils toolchain-funcs

DESCRIPTION="FiSH blowfish encryption irssi module"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="http://fish.secure.la/"

# Point to any required sources; these will be automatically downloaded by
# Portage.
SRC_URI="http://fish.secure.la/irssi/FiSH-irssi.v${PV}-source.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror"

IUSE="amd64 gmp"
DEPEND="
	>=dev-libs/glib-2.2.1
	!gmp? ( dev-libs/miracl )
	gmp? ( dev-libs/gmp )"

RDEPEND="
	>=net-irc/irssi-0.8.9
	${DEPEND}"

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
S="${WORKDIR}/FiSH-irssi.v${PV}-source"

S_IRSSI="/usr/include/irssi"

src_unpack() {
	unpack ${A}

	cd ${S}
	#lame .zip unpacking forces dos2unix
	find ${S} -type f -exec sed -i 's/\r$//' {} \; || die "Failed to dos2unix files"

	if use amd64; then
		epatch "${FILESDIR}"/${P}-fPIC.patch
	fi

	sed -i \
		-e "1d" \
		-e "s:\$(HOME)/irssi-0\.8\.9:${S_IRSSI}:" \
		-e "s:\$(HOME)/glib-1\.2\.10:/usr/$(get_libdir)/glib-2.0:" \
		-e "/^glib_dir /a\\glib_inc = /usr/include/glib-2.0" \
		-e 's:\@echo "Press ENTER to continue or CTRL+C to abort\.\.\."\; read junk::' \
		-e "119d" \
		-e "120d" \
		-e "s:gcc -c -static:$(tc-getCC) -c -static ${CFLAGS}:" \
		-e "s:gcc -static -c:$(tc-getCC) -c -static ${CFLAGS}:" \
		-e "s:gcc -static -shared:$(tc-getCC) -static -shared ${CFLAGS}:" \
		-e "s:gcc -fPIC -shared:$(tc-getCC) -fPIC -shared ${CFLAGS}:" \
		-e "s:gcc -I\. -I\$(glib_dir) -I\$(glib_dir)/include -I\$(glib_dir)/glib -I\$(irssi_dir) -I\$(irssi_dir)/src -I\$(irssi_dir)/src/core -I\$(irssi_dir)/src/fe-common/core -static -O2 -Wall:$(tc-getCC) -static ${CFLAGS} -Wall -I. -I\$(glib_inc) -I\$(glib_inc)/glib -I\$(glib_dir) -I\$(glib_dir)/include -I\$(glib_dir)/glib -I\$(irssi_dir) -I\$(irssi_dir)/src -I\$(irssi_dir)/src/core -I\$(irssi_dir)/src/fe-common/core:" \
		Makefile || die "Failed to update Makefile"

	if use !gmp; then
		epatch "${FILESDIR}"/${P}-include.patch


		sed -i \
			-e "s:miracl\.a:/usr/$(get_libdir)/miracl.a:" \
			Makefile || die "Failed to update Makefile"

		sed -i \
			-e 's:#include "miracl\.h":#include <miracl.h>:' \
			DH1080.h || die "Failed to update DH1080.h"
	else
		sed -i \
			-e "53d" \
			-e "s:DH1080.o miracl.a:DH1080.o -lgmp:" \
			Makefile || die "Failed to update Makefile"

		epatch "${FILESDIR}"/${PN}-gmp.patch
		epatch "${FILESDIR}"/${PN}-gmp-type.patch
	fi
}

src_compile() {
	cd ${S}
	if use amd64; then
		emake amd64 || die "emake failed"
	else
		emake || die "emake failed"
	fi
}

src_install() {
	insopts -m 644
	insinto /usr/$(get_libdir)/irssi/modules
	doins libfish.so

	dodoc FiSH-irssi.txt FiSH-irssi_History.txt blow.ini-EXAMPLE
}
