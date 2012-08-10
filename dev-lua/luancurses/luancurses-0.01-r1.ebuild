# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib

MY_PN="LuaNcurses"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Ncurses interface for Lua"
HOMEPAGE="http://luaforge.net/projects/luancurses/"
SRC_URI="http://luaforge.net/frs/download.php/3224/${MY_P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND=">=dev-lang/lua-5.1"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i \
		-e "s:/usr/local/lib:${D}/usr/$(get_libdir):g" Make.config \
		|| die "sed in Make.config failed"

	sed -i \
		-e "s:^\(COMMONFLAGS = \)-Werror \(.*\):\1 \2 ${CFLAGS}:" \
		-e "s:^\(LDFLAGS.*\):\1 ${LDFLAGS}:" \
		Makefile || die "sed in Makefile failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc README TODO || die "dodoc failed"
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins -r test/* || die "doins failed"
	fi
}

