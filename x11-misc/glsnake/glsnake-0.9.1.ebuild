# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs

DESCRIPTION="Interactive virtual Rubiks' Snake toy"
HOMEPAGE="http://spacepants.org/src/glsnake/"
SRC_URI="http://spacepants.org/src/glsnake/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"

RDEPEND="virtual/glut"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	# The following patch was based on patches from xscreensaver-5.07
	epatch "${FILESDIR}"/${P}-offensive.patch
}

src_compile() {
	# The shipped SConstruct script is used to build only one file. Thus, we're
	# manually building it to avoid scons dependency.
	CONFIG="-DHAVE_GLUT -DHAVE_GETTIMEOFDAY -DGETTIMEOFDAY_TWO_ARGS"
	$(tc-getCC) ${CFLAGS} -o glsnake.o -c -Wall ${CONFIG} glsnake.c || die
	$(tc-getCC) -o glsnake glsnake.o -lglut || die
	# Note that there might be some portability issues with
	# -DGETTIMEOFDAY_TWO_ARGS
}

src_install() {
	dobin glsnake || die
	doman glsnake.6 || die
	dodoc README AUTHORS NEWS THANKS TODO || die
	# We have a couple of icons to freely choose from.
	doicon pixmaps/glsnake_*
	make_desktop_entry glsnake glsnake glsnake_ball.png
}

