# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
 
inherit autotools eutils flag-o-matic games
 
DESCRIPTION="BSP nodebuilder for DooM engine games."
HOMEPAGE="http://games.moria.org.uk/doom/bsp"
SRC_URI="http://games.moria.org.uk/doom/bsp/download/${P}.tar.bz2"
 
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug dmalloc profile"

DEPEND="dmalloc? ( dev-libs/dmalloc )"

src_unpack() {
        unpack ${A}
        cd "${S}"
		# The configure script clobbers CFLAGS and doesn't handle
		# --enable-{debug,profile} correctly. Fix it.
		sed -i \
			-e '/^CFLAGS="-O2 -fomit-frame-pointer"$/d' \
			-e '/^AC_C_COMPILE_FLAGS(.*)$/d' \
			-e 's:^CFLAGS="-g"$:if test "${enableval}" = "yes"; then CFLAGS="${CFLAGS} -g"; fi:' \
			-e 's:^CFLAGS="-pg"$:if test "${enableval}" = "yes"; then CFLAGS="${CFLAGS} -pg"; fi:' \
			configure.in || die "sed configure.in failed"
        # We want documentation to be installed only through dodoc
        sed -i \
			-e '/^docdir =.*/d' \
			-e '/^doc_DATA =.*/d' \
			Makefile.am || die "sed Makefile.am failed"
        eautoreconf || die "eautoreconf failed"
}
 
src_compile() {
	# gcc chokes if -g and -fomit-frame-pointer are given
	use debug && filter-flags -fomit-frame-pointer
	# gcc chokes if -pg and -fomit-frame-pointer are given
	use profile && filter-flags -fomit-frame-pointer
	egamesconf \
		$(use_enable debug) \
		$(use_enable dmalloc) \
		$(use_enable profile) \
		|| die "egamesconf failed"
	emake || die "emake failed"
}
 
src_install() {
        emake DESTDIR="${D}" install || die "emake install failed"
        dodoc AUTHORS NEWS README visplane.txt
        prepgamesdirs
}
