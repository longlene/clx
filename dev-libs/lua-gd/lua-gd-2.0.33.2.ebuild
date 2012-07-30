# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit flag-o-matic toolchain-funcs versionator

# 2.0.33.2  -->  2.0.33r2
MY_PV=$(replace_version_separator 3 'r' )
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Lua-GD is a set of Lua bindings to the Thomas Boutell's gd library"
HOMEPAGE="http://lua-gd.luaforge.net/"
SRC_URI="http://luaforge.net/frs/download.php/1592/${MY_P}.tar.gz
	mirror://sourceforge/${PN}/${PN}/${MY_P}%20%28for%20Lua%205.1%29/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc examples"

RDEPEND="=dev-lang/lua-5.1*
	media-libs/gd"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	append-flags -fPIC
	sed -i \
		-e "s:^\(LUAPKG=lua\)5\.1:\1:" \
		-e "s:^CC=.*:CC=$(tc-getCC):" \
		-e "s:^\(CFLAGS=.*\) -O3 -Wall:\1 ${CFLAGS}:" \
		-e "s:^\(INSTALL_PATH=\)\(.*\):\1${D}/\2:" \
		-e "s:install -s:install:" \
		Makefile
}

src_install() {
	mkdir -p ${D}/$(pkg-config lua --variable=INSTALL_CMOD)
	emake install || die "Install failed"

	if use doc; then
		# Around 400K of HTML documentation
		dohtml doc/* || die
		dodoc README || die
	fi

	if use examples; then
		# Around 132K of examples
		insinto /usr/share/doc/${PF}
		doins -r demos || die
	fi
}
