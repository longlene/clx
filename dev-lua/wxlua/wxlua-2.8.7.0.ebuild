# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PN="wxLua"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Set of bindings to the wxWidgets library for the Lua programming language."
HOMEPAGE="http://wxlua.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}-src.tar.gz"

LICENSE="wxWinFDL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="opengl unicode"

DEPEND=">=dev-lang/lua-5.1
	>=x11-libs/wxGTK-2.8.7.0
	opengl? ( virtual/opengl )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i -e "s/-llua5.1/-llua/g" \
		apps/build/msw/makefile.gcc \
		apps/Makefile.in \
		modules/build/msw/makefile.gcc \
		modules/Makefile.in \
		configure || die "sed failed"
	sed -i -e "/ lua\/include/d" modules/Makefile.in || die "sed failed"
}

src_compile() {
	econf --enable-systemlua \
		$(use_enable opengl wxbindgl) \
		$(use_enable unicode)
	# Parallel make fails
	emake -j1 || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
